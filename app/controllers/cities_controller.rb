class CitiesController < ApplicationController 
  def index
    @cities = City.all.order(created_at: :desc)
  end

  def show
    @city = City.find(params[:id])
  end

  def new
  end

  def create
    city = City.create!(city_params)
    redirect_to '/cities'
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    city = City.find(params[:id])
    city.update(city_params)
    city.save
    redirect_to "/cities/#{city.id}"
  end

  def destroy

  end

  private

  def city_params 
    params.permit(:name, :population, :state_capital)
  end
end