class CitiesController < ApplicationController 
  def index
    @cities = City.all.order(created_at: :desc)
  end

  def show
    @city = City.find(params[:id])
  end

  def new
    
  end
end