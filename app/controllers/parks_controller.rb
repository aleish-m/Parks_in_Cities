class ParksController < ApplicationController
  def index
    @parks = Park.all
  end

  def show
    @park = Park.find(params[:id])
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    park = Park.find(params[:id])
    park.update(name: params[:park_name], acres: params[:park_acres], visitor_center: params[:visitor_center], playground: params[:playground], opening_hour: params[:opening_hour], closing_hour: params[:closing_hour])
    park.save
    redirect_to "/parks/#{park.id}"
  end
end
