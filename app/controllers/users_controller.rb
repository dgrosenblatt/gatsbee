class UsersController < ApplicationController
  before_action :authenticate_user

  def show
    @user = current_user
    @comments = @user.recent_comments
  end
end
