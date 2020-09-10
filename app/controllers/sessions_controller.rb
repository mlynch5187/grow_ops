class SessionsController < ApplicationController
  def create
    access_token = request.env['omniauth.auth']
    user = User.from_omniauth(access_token)
    user.google_token = access_token.credentials.token
    user.email = access_token.info.name
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save
    session[:user_id] = user.id
    redirect_to '/users'
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
