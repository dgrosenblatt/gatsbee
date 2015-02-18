class ClubsController < ApplicationController
  before_action :authenticate_user, except: :index
  before_action :authorize_organizer, only: [:edit, :update, :destroy]

  def index
    if params[:query]
      @query = params[:query]
      @clubs = Club.search(@query)
    else
      @clubs = Club.all
    end
  end

  def show
    @comment = Comment.new
    @club = Club.find(params[:id])
    @meetings = @club.meetings
    @meeting = Meeting.new
    if !@club.current_book.nil?
      @comments = @club.comments.where(book_id: @club.current_book.id)
    end
    if @club.users.include?(current_user)
      @membership = Membership.find_by(user_id: current_user.id, club_id: @club.id)
    end
  end

  def new
    @club = Club.new
  end

  def create
    @club = Club.new(club_params)
    @club.organizer = current_user
    if !params[:club][:current_book].empty?
      @club.assign_book(params[:club][:current_book])
    end
    if @club.save
      @club.users << current_user
      redirect_to @club, notice: "New Club Created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if !params[:club][:current_book].empty?
      @club.assign_book(params[:club][:current_book])
    end
    if @club.update_attributes(club_params)
      redirect_to @club, notice: "Book Club Updated!"
    else
      render :edit
    end
  end

  def destroy
    @club.destroy
    redirect_to clubs_path, notice: "Club Deleted!"
  end

  private

  def club_params
    params.require(:club).permit(:name, :description)
  end

  def authorize_organizer
    @club = Club.find(params[:id])
    redirect_to @club if @club.organizer != current_user
  end
end
