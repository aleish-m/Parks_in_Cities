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
    city = City.create!(name: params[:city_name], population: params[:city_population], state_capital: params[:state_capital])
    redirect_to '/cities'
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    city = City.find(params[:id])
    city.update(name: params[:city_name], population: params[:city_population], state_capital: params[:state_capital])
    city.save
    redirect_to "/cities/#{city.id}"
  end

  def destroy

  end
end