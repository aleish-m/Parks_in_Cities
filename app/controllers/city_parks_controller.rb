class CityParksController < ApplicationController
  def index
    @city = City.find(params[:id])
  end
end