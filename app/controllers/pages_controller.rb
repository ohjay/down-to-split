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
      @user.expenses.each do |e|
        category = e.purchase.category
        #cost = e.percentage * e.purchase.cost
        #@totals[category] += cost
        #@totals[total] += cost
      end
    end
  end
  
  def debt
    @debts = Hash.new
    @debts = {}
    @user = current_user
    if user_signed_in?
      @user.expenses.each do |e|
        if ShoppingTrip.(e.purchase.shopping_trip.id).exists?
          debtor = User.find(ShoppingTrip.find(e.purchase.shopping_trip).user_id)
          cost = e.percentage * e.purchase.cost
          if @debts.has_key?(debtor)
            @debts[debtor] += cost
          else
            @debts[debtor] = cost
          end
        end
      end
    end
  end

  def copy
    @source = Product.find(params[:id])
    @product = @source.dup
    render 'new'
  end
  
  def pricecomp
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
    @shopping_trip.save

    @vendor.shopping_trips << @shopping_trip
    @vendor.save
    @date = params[:shopping_trip][:purchase][:date_purchased]

    @users = params[:shopping_trip][:user_ids]
    @users.each do |u|
      if u.to_i > 0
          User.find(u.to_i).shopping_trip_id = @shopping_trip.id
          @shopping_trip.users << User.find(u.to_i)
      end
    end

    if @date
      @shopping_trip.name = @vendor.vendor_name + ' (' + @date.to_s + ')'
    else
      @shopping_trip.name = @vendor.vendor_name 
    end

    @shopping_trip.save
    @user.shopping_trips << @shopping_trip
    redirect_to trip_path(current_user.id, :date_purchased => @date, :shopping_trip => @shopping_trip)
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
      @product = Product.new
      @product.product_name = params[:product][:product_name]
      @product.save

      @purchase = @product.purchases.create! purchase_params
      @purchase.date_purchased = params[:date_purchased]
      @purchase.save

      @shopping_trip.purchases << @purchase
      @shopping_trip.save
      # session[:date] = nil

      # @expense = Expense.new
      # @expense.user_id = current_user.id
      # @purchase.expenses << @expense

      @user.purchases << @purchase
      @user.save

      if params[:product][:purchases_attributes]
        @products = params[:product][:purchases_attributes]
        @products.each do |key, value|
          @product = Product.new
          @product.product_name = value[:product_name]
          @product.save

          @purchase = Purchase.new
          @purchase.cost = value[:cost]
          @purchase.category = value[:category]
          @purchase.date_purchased = params[:date]
          @purchase.save
          @product.purchases << @purchase
          @product.save

          @user.purchases << @purchase
          @user.save
          @shopping_trip.purchases << @purchase
          @shopping_trip.save
        end  
      end

      redirect_to expenses_path
    end
  end

  private

  def shopping_trip_params
    params.require(:shopping_trip).permit(
      :name, 
      :vendor_name,
      :user_ids,
      :date_purchased,
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
      purchases_attributes: [:id, :product_name, :category, :cost, :_destroy]) if params[:product]
  end

  def purchase_params
    params.require(:purchase).permit(:cost, :category) if params[:purchase]
  end
  
  def terms_of_service
  end
end
