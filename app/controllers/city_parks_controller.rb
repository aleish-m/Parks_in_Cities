class CityParksController < ApplicationController
  def index
    @city = City.find(params[:id])
    @parks = @city.parks.min_acreage(params[:number]).order(params[:sort])
  end

  def new
    @city = City.find(params[:id])
  end

  def create
    @city = City.find(params[:id])

    @city.parks.create!(park_params)

    redirect_to "/cities/#{@city.id}/parks"
  end

  private

  def park_params 
    params.permit(:name, :acres, :visitor_center, :playground, :opening_hour, :closing_hour)
  end
end