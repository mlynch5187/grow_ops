class Users::PlantsController < ApplicationController

  def new
    @garden = Garden.find(params[:garden_id])
    @plants = Plant.recommendations(@garden.zip_code, @garden.light).sample(100)
  end
end
