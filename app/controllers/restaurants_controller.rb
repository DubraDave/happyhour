class RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @restaurants = Restaurant.all
    @hash = Gmaps4rails.build_markers(@restaurants) do |rest, marker|
      marker.lat rest.latitude
      marker.lng rest.longitude
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
      respond_to do |format|
      if @restaurant.update_attributes(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_path, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @hash = Gmaps4rails.build_markers(@restaurant) do |rest, marker|
      marker.lat rest.latitude
      marker.lng rest.longitude
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address1, :address2, :state, :zip)
  end
end
