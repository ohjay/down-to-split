class PagesController < ApplicationController
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

  def vendor
    @user = current_user
    @vendor = Vendor.create vendor_params

    @vendor.save
    
  end

  def create
    @user = current_user
    @product = Product.create product_params
    
    @product.save
    @purchase = @product.purchases.create purchase_params
    @purchase.save

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
    params.require(:purchase).permit(:cost) if params[:purchase]
  end
end
