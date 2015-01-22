class UsersController < ApplicationController
  before_action :authenticate_user

  def show
    @user = current_user
    @comments = @user.comment_feed
    @clubs = @user.clubs_and_books
  end
end
