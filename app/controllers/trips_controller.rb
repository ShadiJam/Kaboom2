class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
    @trips = Trip.order('created_at DESC')
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
    @user = User.find(current_user[:id])
    @trip = Trip.find(params[:id])
    @place = @trip.places.build
  end

  # GET /trips/new
  def new
    @user = User.find(current_user[:id])
    @trip = @user.trips.new(trip_params)
  end

  # GET /trips/1/edit
  def edit
    @user = User.find(current_user[:id])
    @trip = @user.trip.update(trip_params)
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip.user_id = current_user.id
    @trip = @trip.user_id.trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    @trip.user_id = current_user.id
    @trip = @trip.user_id.trips.update(trip_params)

    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render :show, status: :ok, location: @trip }
      else
        format.html { render :edit }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.user_id = current_user.id
    @trip = @trip.user_id.trips.destroy(trip_params)
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:start_date, :end_date, :trip_name)
    end
end
