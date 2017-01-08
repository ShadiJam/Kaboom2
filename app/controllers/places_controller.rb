class PlacesController < ApplicationController
before_action :set_place, only: [:show, :edit, :update, :destroy, :search]
  def index
    @places = Place.order('created_at DESC')
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def edit
  end

  def import
    Place.import(params[:file])
    redirect_to root_url, notice: "Places imported."
  end

  def create
    @place = Place.new(place_params)

    respond_to do |format|
      if @place.save
        @place.update_attributes(latitude: Geocoder.coordinates(@place.address)[0], longitude: Geocoder.coordinates(@place.address)[1])
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def set_place
      @place = Place.find(params[:id])
    end

  def place_params
    params.require(:place).permit(:title, :address, :latitude, :longitude, :category, :city, :street, :state, :country)
  end
end
