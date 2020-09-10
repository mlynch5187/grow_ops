class Users::GardensController < ApplicationController
  def new
    @garden = Garden.new
  end

  def create
    current_user.gardens.create(
      name: garden_params[:name],
      length_cm: ((garden_params[:length_feet].to_i * 12) + garden_params[:length_inches].to_i) * 2.54,
      width_cm: ((garden_params[:width_feet].to_i * 12) + garden_params[:width_inches].to_i) * 2.54,
      zip_code: garden_params[:zip_code]
    )
    redirect_to "/dashboard"
  end

  private

  def garden_params
    params.permit(:name, :length_feet, :length_inches, :width_feet, :width_inches, :zip_code)
  end
end
