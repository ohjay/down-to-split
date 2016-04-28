class PagesController < ApplicationController
  def live_search
    @vendors = Vendor.where("vendor_name like ?", "%" + params[:q] + "%")
    render :layout => false
  end
  
  def index
  end
  
  def expenses
    @purchase = Purchase.new
    @users = User.new
    @shopping_trip = ShoppingTrip.new
    @product = Product.new
    
    @totals = Hash.new(0)
    @totals[:food] = 0
    @totals[:household] = 0
    @totals[:entertainment] = 0
    @totals[:education] = 0
    @totals[:travel] = 0
    @totals[:clothing] = 0
    @totals[:total] = 0
    
    @user = current_user
    if user_signed_in?
    end
  end
  
  def debt
    @debts = Hash.new
    @debts = {}
    @user = current_user
    if user_signed_in?
        @debts = Debt.debt_owed(@user)
    end
    @user_debts = Debt.where(debtor: @user)
    @user_credits = Debt.where(creditor: @user)
  end

  def debt_show
    @user = User.find_by_username(params[:user])
    # @debts = Debt.where('(creditor = ? AND debtor = ?) OR (creditor = ? AND debtor = ?)', @user, current_user, current_user, @user)
  end

  def edit_debt 
    # @pokemon = Pokemon.find params[:id]
    # @pokemon.health -= 10
    # if @pokemon.health <= 0
    #   @pokemon.destroy
    # else
    #   @pokemon.save
    # end
    # @debt = Debt.find(params[:id])
    # @debt.destroy!
    Debt.delete(params[:id])
    redirect_to request.referrer
  end

  def copy
    @source = Product.find(params[:id])
    @product = @source.dup
    render 'new'
  end
  
  def pricecomp
    @user = current_user
    @cheapest_prices = {}
    if user_signed_in?
      @user.purchases.each do |p|
        if @cheapest_prices.has_key?(p.product_name)
          if p.cost
            if p.cost < @cheapest_prices[p.product_name][0]
              @cheapest_prices[p.product_name] = Array[p.cost, p.vendor_name]
            end
          end
        else
          @cheapest_prices[p.product_name] = Array[p.cost, p.vendor_name]
        end
      end
    end
  end
  
  def about
  end

  def new
    @product = Product.new
    @purchase = @product.build_purchase
    @vendor = Vendor.new
    @vendor.shopping_trip.build
    @shopping_trip = ShoppingTrip.new
    3.times do
      @shopping_trip.purchases.build
    end
    @purchases = @shopping_trip.purchases.build
    @debts = @shopping_trip.debts.build
    
  end

  def trip
    @vendor = Vendor.new
    @users = User.all
    @product = Product.new
    # @vendor.shopping_trip.build
    # @shopping_trip = ShoppingTrip.new
    # @purchases = @shopping_trip.purchases.build
    
  end

  def create_trip
    @user = current_user
    @vendor = Vendor.create!
    @vendor.vendor_name = params[:shopping_trip][:vendor_name]
    @vendor.save
    @shopping_trip = ShoppingTrip.new
    @shopping_trip.save!

    @vendor.shopping_trips << @shopping_trip
    @vendor.save
    @date = params[:shopping_trip][:purchase][:date_purchased]

    @users = params[:shopping_trip][:user_ids]
    if @users
      @users.each do |u|
        if u.to_i > 0
            @splitter = User.find(u.to_i)
            @splitter.shopping_trips << @shopping_trip
            @splitter.save
            # @shopping_trip.users << @splitter
        end
      end
    end

    if @date.blank?
      @date = Date.today 
    end
    # @shopping_trip.name = @vendor.vendor_name + ' (' + @date.to_s + ')'
    @shopping_trip.name = @vendor.vendor_name
    @shopping_trip.date = @date
    @shopping_trip.save
    @user.shopping_trips << @shopping_trip
    @user.save
    redirect_to trip_path(current_user.id, :date_purchased => @date, :shopping_trip => @shopping_trip, :users => @users, :vendor => @vendor)
  end

  def shopping_trip
    @shopping_trip = ShoppingTrip.find(params[:id])
  end

  def create
    if params[:addpa].present?
      render :action => :new
    else
      @user = current_user
      @shopping_trip = ShoppingTrip.find(params[:shopping_trip])
      @vendor = Vendor.find(params[:vendor])
      @product = Product.where(product_name: params[:product][:product_name]).first
      if @product.blank?
        @product = Product.new
        @product.product_name = params[:product][:product_name]
        @product.save
      end

      @purchase = @product.purchases.create! purchase_params
      @purchase.category = @purchase.category.to_s.titleize
      @purchase.date_purchased = params[:date_purchased]
      @purchase.shopping_trip_id = @shopping_trip.id
      @purchase.save
      @splitters = params[:users]
      @percentage = 1.0 / @splitters.length.to_f
      @splitters.each do |splitter_id|
        @splitter = User.find(splitter_id)
        @debt_cost = @purchase.cost * @percentage
        if splitter_id != @user.id 
          @debt = Debt.new
          @debt.creditor = @user
          @debt.debtor = @splitter
          @debt.cost = @debt_cost
          @debt.shopping_trip_id = @shopping_trip.id
          @debt.save
          @shopping_trip.debts << @debt
          @shopping_trip.save
          @purchase.debts << @debt
          @purchase.save
        end

        @expense = Expense.new
        @expense.user_id = splitter_id.to_i
        @expense.purchase_id = @purchase.id
        @expense.percentage = @percentage
        @expense.save
      end

      # update attributes and save
      @purchase.save
      @shopping_trip.total += @purchase.cost
      @shopping_trip.purchases << @purchase
      @shopping_trip.save
      @vendor.purchases << @purchase
      @vendor.save
      @user.purchases << @purchase
      @user.save

      if params[:product][:purchases_attributes]
        @products = params[:product][:purchases_attributes]
        @products.each do |key, value|
          @product = Product.where(product_name: value[:product_name]).first
          if @product.blank?
            @product = Product.new
            @product.product_name = value[:product_name]
            @product.save
          end

          @purchase = Purchase.new
          @purchase.cost = value[:cost]
          @shopping_trip.total += @purchase.cost
          @purchase.category = value[:category].to_s.titleize
          @purchase.date_purchased = params[:date]
          @purchase.shopping_trip_id = @shopping_trip.id
          @purchase.save

          if value[:user_ids]
            @splitters = value[:user_ids]
          else
            @splitters = []
          end
          @percentage = 1.0 / @splitters.length.to_f
          @splitters.each do |splitter_id|
            @splitter = User.find(splitter_id)
            @debt_cost = @purchase.cost * @percentage
            if splitter_id != @user.id
              @debt = Debt.new
              @debt.creditor = @user
              @debt.debtor = @splitter
              @debt.cost = @debt_cost
              @debt.shopping_trip_id = @shopping_trip.id
              @debt.save
              @shopping_trip.debts << @debt
              @shopping_trip.save
              @purchase.debts << @debt
              @purchase.save
              # if @splitter.debts.has_key?(@user.id)
              #   @splitter.debts[@user.id] += @n_debt
              # else 
              #   @splitter.debts[@user.id] = @n_debt
              # end
              # if @user.debts.has_key?(splitter_id)
              #   @user.debts[splitter_id] += @p_debt
              # else
              #   @user.debts[splitter_id] = @p_debt
              # end
              # @user.save
              # @splitter.save
            end

            @expense = Expense.new
            @expense.user_id = splitter_id.to_i
            @expense.purchase_id = @purchase.id
            @expense.percentage = @percentage
            @expense.save
          end

          @purchase.save
          @product.purchases << @purchase
          @product.save

          @user.purchases << @purchase
          @user.save
          @shopping_trip.purchases << @purchase
          @shopping_trip.save
          @vendor.purchases << @purchase
          @vendor.save
        end  
      end

      redirect_to expenses_path
    end
  end

  private

  def debt_params
    params.require(:debt).permit(
      :cost)
  end

  def shopping_trip_params
    params.require(:shopping_trip).permit(
      :name, 
      :vendor_name,
      :user_ids,
      :date_purchased,
      debts_attributes: [:id, :debtor_id, :creditor_id, :cost, :_destroy],
      :purchase => [:date_purchased],
      users_attributes: [:id, :username, :_destroy], 
      vendor_attributes: [:id, :vendor_name, :_destroy],
      purchase_attributes: [:id, :category, :date_purchased, :_destroy] )
  end

  def vendor_params 
    params.require(:vendor).permit(
      :vendor_name,
      shopping_trips_attributes: [:id, :name, :_destroy, purchases_attributes: [:id, :category, :_destroy] ]) if params[:vendor]
  end

  def product_params
    params.require(:product).permit(
      :product_name,
      :users => [],
      :user_ids => [],
      purchases_attributes: [:id, :product_name, :category, :cost, :_destroy]) if params[:product]
  end

  def purchase_params
    params.require(:purchase).permit(
      :cost, 
      :category,
      :user_ids => []) if params[:purchase]
  end
  
  def terms_of_service
  end
end
