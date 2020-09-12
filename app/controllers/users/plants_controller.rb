class Users::PlantsController < ApplicationController

  def new
    @garden = Garden.find(params[:garden_id])
    require"pry"; binding.pry
    @plants = Plant.recommendations(@garden.zip_code, @garden.light)
  end
end
