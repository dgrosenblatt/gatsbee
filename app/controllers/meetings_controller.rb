class MeetingsController < ApplicationController
  def create
    @club = Club.find(params[:club_id])
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user
    @meeting.club = @club
    if @meeting.save
      flash[:notice] = "New Meeting Created!"
    else
      flash[:notice] = "Something went wrong"
    end
    redirect_to @club
  end

  private
  def meeting_params
    params.require(:meeting).permit(:location, :meeting_time)
  end
end
