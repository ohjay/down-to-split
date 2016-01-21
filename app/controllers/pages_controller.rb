class PagesController < ApplicationController
  def live_search
    @vendors = Vendor.where("vendor_name like ?", "%" + params[:q] + "%")
    render :layout => false
  end
  
  def index
  end
  
  def expenses
    @purchase = Purchase.new
  end
  
  def debt
  end
  
  def pricecomp
  end
  
  def about
  end

  def new
    @product = Product.new
    @purchase = @product.build_purchase
  end

  def trip
    @vendor = Vendor.new
    @shopping_trip = ShoppingTrip.new
  end

  def create_trip
    @vendor = Vendor.create vendor_params
    @vendor.save
    @shopping_trip = ShoppingTrip.create!
    @vendor.shopping_trips << @shopping_trip
    @vendor.save
    @date = params[:purchase][:date_purchased]

    @shopping_trip.name = @vendor.vendor_name + '(' + @date.to_s + ')'
    redirect_to trip_path(current_user.id, :date_purchased => @date, :shopping_trip => @shopping_trip)
  end

  def shopping_trip
    @shopping_trip = ShoppingTrip.find(params[:id])
  end

  def create
    @user = current_user
    @product = Product.create! product_params
    @product.save

    @purchase = @product.purchases.create! purchase_params
    @purchase.date_purchased = params[:date]
    @purchase.save

    @shopping_trip = ShoppingTrip.find(params[:shopping_trip])
    @shopping_trip.purchases << @purchase
    @shopping_trip.save
    # session[:date] = nil

    # @expense = Expense.new
    # @expense.user_id = current_user.id
    # @purchase.expenses << @expense

    @user.purchases << @purchase
    @user.save

    redirect_to expenses_path
  end

  private

  def vendor_params 
    params.require(:vendor).permit(:vendor_name) if params[:vendor]
  end

  def product_params
    params.require(:product).permit(:product_name) if params[:product]
  end

  def purchase_params
    params.require(:purchase).permit(:cost, :category) if params[:purchase]
  end
end
