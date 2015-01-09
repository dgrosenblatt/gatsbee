class ClubsController < ApplicationController
  before_action :authenticate_user, except: :index

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
      @club.users << current_user
      redirect_to @club, notice: "New Club Created!"
    else
      render :new
    end
  end

  def edit
    @club = Club.find(params[:id])
    render :show if @club.organizer != current_user
  end

  def update
    @club = Club.find(params[:id])
    if @club.organizer == current_user
      @club.update_attributes(club_params)
      redirect_to @club, notice: "Book Club Updated!"
    else
      render :show
    end
  end

  def destroy
    @club = Club.find(params[:id])
    @club.destroy if @club.organizer == current_user
    redirect_to clubs_path, notice: "Club Deleted!"
  end

  private

  def club_params
    params.require(:club).permit(:name, :description, :visibility)
  end

end
