class PagesController < ApplicationController
  def live_search
    @vendors = Vendor.where("vendor_name like ?", "%" + params[:q] + "%")
    render :layout => false
  end
  
  def index
  end
  
  def expenses
    @purchase = Purchase.new
    @totals = Hash.new(0)
    @totals[:food] = 0
    @totals[:household] = 0
    @totals[:entertainment] = 0
    @totals[:education] = 0
    @totals[:travel] = 0
    @totals[:clothing] = 0
    @totals[:total] = 0
    @user.expenses.each do |e|
      category = e.purchase.category
      cost = e.percentage * e.purchase.cost
      @totals[category] += cost
      @totals[total] += cost
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
    params.require(:purchase).permit(:cost, :category) if params[:purchase]
  end
end
