class CityParksController < ApplicationController
  def index
    @city = City.find(params[:id]).sort
  end
end