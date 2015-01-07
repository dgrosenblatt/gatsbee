class ClubsController < ApplicationController
  before_action :authenticate_user, only: [:show]

  def index
    @clubs = Club.all
  end

  def show
    @club = Club.find(params[:id])
  end

end
