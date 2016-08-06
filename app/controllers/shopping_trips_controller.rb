class ShoppingTripsController < ApplicationController
  before_action :set_shopping_trip, only: [:show, :edit, :update, :destroy]

  # GET /shopping_trips
  # GET /shopping_trips.json
  def index
    @shopping_trips = ShoppingTrip.where(payer: @user)
  end

  # GET /shopping_trips/1
  # GET /shopping_trips/1.json
  def show
  end

  # GET /shopping_trips/new
  def new
    @shopping_trip = ShoppingTrip.new
  end

  # GET /shopping_trips/1/edit
  def edit
  end

  # POST /shopping_trips
  # POST /shopping_trips.json
  def create
    @shopping_trip = ShoppingTrip.new(shopping_trip_params)

    respond_to do |format|
      if @shopping_trip.save
        format.html { redirect_to @shopping_trip, notice: 'Shopping trip was successfully created.' }
        format.json { render :show, status: :created, location: @shopping_trip }
      else
        format.html { render :new }
        format.json { render json: @shopping_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopping_trips/1
  # PATCH/PUT /shopping_trips/1.json
  def update
    respond_to do |format|
      if @shopping_trip.update(shopping_trip_params)
        format.html { redirect_to @shopping_trip, notice: 'Shopping trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @shopping_trip }
      else
        format.html { render :edit }
        format.json { render json: @shopping_trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_trips/1
  # DELETE /shopping_trips/1.json
  def destroy
    @shopping_trip.destroy
    respond_to do |format|
      format.html { redirect_to shopping_trips_url, notice: 'Shopping trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_trip
      @shopping_trip = ShoppingTrip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_trip_params
      params.require(:shopping_trip).permit(:name, :vendor_id, :user_id, :total, :date)
    end
end
