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
end