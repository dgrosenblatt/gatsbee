class MeetingsController < ApplicationController
  before_action :authenticate_user

  def create
    @club = Club.find(params[:club_id])
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user
    @meeting.club = @club
    if @meeting.save
      redirect_to @club, notice: "New Meeting Created!"
    else
      @comment = Comment.new
      @comments = @club.comments
      @membership = Membership.find_by(user_id: current_user.id,
                                       club_id: @club.id)
      render 'clubs/show'
    end
  end

  private
  def meeting_params
    params.require(:meeting).permit(:location, :meeting_time)
  end
end
