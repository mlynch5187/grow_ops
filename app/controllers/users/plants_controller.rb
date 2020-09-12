class Users::PlantsController < ApplicationController

  def new
    @plants = Plant.recommendations(zip, light).first(50)
  end
end
