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

  def new_garden
    garden = Garden.find(params[:garden_id])
    plants = PlantObject.plant_details(session[:plants])
    plants.each do |plant|
      garden.plants.create(
        trefle_id: plant.id,
        name: plant.name,
        row_spacing: plant.row_spacing,
        spread: plant.spread,
        edible: plant.edible,
        image: plant.images[:flower][0][:image_url],
        light: plant.light,
        ph_min: plant.ph_min,
        ph_max: plant.ph_max,
        days_to_harvest: plant.days_to_harvest,
        min_temp: plant.min_temp,
        max_temp: plant.max_temp,
        link_to_show_page: plant.link_to_show_page,
        quantity: session[:plant_quantity][plant.id.to_s]
      )
    end
    session[:plant] = nil
    session[:plot] = nil
    session[:plant_quantity] = nil

    redirect_to '/dashboard'

    flash[:success] = "Garden has been created!"
  end
end
