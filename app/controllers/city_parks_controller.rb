class CityParksController < ApplicationController
  def index
    @city = City.find(params[:id])
  end

  def new
    @city = City.find(params[:id])
  end

  def create
    @city = City.find(params[:id])

    @city.parks.create!(name: params[:park_name], acres: params[:park_acres], visitor_center: params[:visitor_center], playground: params[:playground], opening_hour: params[:opening_hour], closing_hour: params[:closing_hour])

    redirect_to "/cities/#{@city.id}/parks"
  end
end