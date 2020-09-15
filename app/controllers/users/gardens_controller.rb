class Users::GardensController < ApplicationController
  def new
    @garden = Garden.new
  end

  def show
    @garden = Garden.find(params[:id])
    @plants = @garden.plants.select('distinct on (name) *')
  end

  def create
    current_user.gardens.create(
      name: garden_params[:name],
      length_cm: ((garden_params[:length_feet].to_i * 12) + garden_params[:length_inches].to_i) * 2.54,
      width_cm: ((garden_params[:width_feet].to_i * 12) + garden_params[:width_inches].to_i) * 2.54,
      zip_code: garden_params[:zip_code],
      light: garden_params[:light]
    )
    redirect_to "/dashboard"
  end

  private

  def garden_params
    params.permit(:name, :length_feet, :length_inches, :width_feet, :width_inches, :zip_code, :light)
  end
end
