class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @user = User.find(params[:id])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    if @user != current_user
      render :text => '404 error, son. We couldn\'t find that page. :(<br>' \
          + 'While you\'re here, why not check out <a href="https://youtu.be/Pr1YY_QSt74">' \
          + 'Professor Oak\'s lecture on Ivysaur</a>?<br>#bulbasaurmasterrace', :status => '404'
      return
    end
    @total_spent = 0.0
    @user.purchases.weeks_purchases.each do |p|
      @expense = Expense.find_by(user_id: @user.id, purchase_id: p.id)
      if @expense
        if @expense.percentage
          @cost = @expense.percentage * p.cost
          @total_spent += @cost
        end
      end
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find params[:id]
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :weekly_budget, :encrypted_password,
        debts_attributes: [:id, :debtor_id, :creditor_id, :cost, :_destroy])
    end
end
