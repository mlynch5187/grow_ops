class Users::PlantsController < ApplicationController

  def new
    @garden = Garden.find(params[:garden_id])
    @plants = PlantObject.recommendations(@garden.zip_code, @garden.light)
  end

  def create
    @garden = Garden.find(params[:garden_id])
    @plants = PlantObject.plant_details(params[:plant], @garden.id)
    redirect_to "/users/gardens/#{@garden.id}/plants/plot"
  end

  def plot
    @garden = Garden.find(params[:garden_id])
    require"pry"; binding.pry
  end

end
