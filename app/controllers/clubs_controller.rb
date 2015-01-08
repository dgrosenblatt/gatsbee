class ClubsController < ApplicationController
  before_action :authenticate_user, only: [:show]

  def index
    if params[:query]
      @query = params[:query]
      @clubs = Club.search(@query)
    else
      @clubs = Club.all
    end
  end

  def show
    @club = Club.find(params[:id])
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    @club.organizer = current_user
    if @club.save
      redirect_to @club, notice: "New Club Created!"
    else
      render :new
    end
  end

  private

  def club_params
    params.require(:club).permit(:name, :description, :visibility)
  end

end
