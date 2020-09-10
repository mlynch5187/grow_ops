class UsersController < ApplicationController
  def show
    @gardens = Garden.where(:user_id == current_user.id)
  end
end
