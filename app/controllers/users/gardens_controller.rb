class Users::GardensController < ApplicationController
  def new
    @garden = Garden.new
  end

  def create
    require"pry"; binding.pry
  end
end
