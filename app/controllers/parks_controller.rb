class ParksController < ApplicationController
  def index
    @parks = Park.where(playground: true)
  end

  def show
    @park = Park.find(params[:id])
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    park = Park.find(params[:id])
    park.update(park_params)
    park.save
    redirect_to "/parks/#{park.id}"
  end


  private

  def park_params 
    params.permit(:name, :acres, :visitor_center, :playground, :opening_hour, :closing_hour)
  end
end
