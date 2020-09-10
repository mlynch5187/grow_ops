class Users::GardensController < ApplicationController
  def new
    @garden = Garden.new
  end

  def create
    require"pry"; binding.pry
  end

  private

  def dimensions
    length_cm = ((params[:length_feet].to_i * 12) + params[:length_inches].to_i) * 2.54
    width_cm = ((params[:width_feet].to_i * 12) + params[:width_inches].to_i) * 2.54
    garden_dimensions = length_cm * width_cm
  end
end
