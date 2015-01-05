class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to profile_path, notice: "You have signed in to GatsBee."
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "You have signed out"
  end
end
