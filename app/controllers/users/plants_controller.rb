class Users::PlantsController < ApplicationController

  def new
    @garden = Garden.find(params[:garden_id])
    @plants = PlantObject.recommendations(@garden.zip_code, @garden.light)
  end

  def create
    @garden = Garden.find(params[:garden_id])
    session[:plants] = params[:plant]
    session[:plot] = @garden.plot_size

    quantity = {}
    params[:plant].each do |plant|
      quantity[plant] = 0
    end
    session[:plant_quantity] = quantity

    redirect_to "/users/gardens/#{@garden.id}/plants/plot"
  end

  def plot
    @garden = Garden.find(params[:garden_id])
    @plants = PlantObject.plant_details(session[:plants])
    @size = session[:plot]
    # create a final selection and add to db garden.plants.new
    # delete plant session -- session[:plants].delete
  end

  def increase
    garden = Garden.find(params[:garden_id])
    unless session[:plot] <= 50
      session[:plot] -= 100
      session[:plant_quantity][params[:plant_id]] += 1
    else
      flash[:error] = "You have exceeded the maximum space for #{garden.name}!"
    end
    redirect_back(fallback_location: root_path)
  end

  def decrease
    garden = Garden.find(params[:garden_id])
    unless (session[:plot] == Garden.find(params[:garden_id]).plot_size) || (session[:plant_quantity][params[:plant_id]] == 0)
      session[:plot] += 100
      session[:plant_quantity][params[:plant_id]] -= 1
    else
      flash[:error] = "You already have the maximum space for #{garden.name}!"
    end
    redirect_back(fallback_location: root_path)
  end
end
