class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    @stars = average_rating
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def average_rating
    ratings = []
    @restaurants.each do |restaurant|
      reviews = restaurant.reviews.all
      rating = 0
      reviews.each do |review|
        rating += review.rating
      end
      if reviews.count != 0
        ratings << rating/reviews.count
      else
        ratings << "No rating yet"
      end
    end
    ratings
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number)
  end

  def find_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
