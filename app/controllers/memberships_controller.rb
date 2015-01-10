class MembershipsController < ApplicationController
  before_action :authenticate_user

  def create
    @membership = Membership.new
    @club = Club.find(params[:membership][:club_id])
    @membership.club = @club
    @membership.user = current_user
    if @membership.save
      flash[:notice] = "You have joined #{@club.name}"
    else
      flash[:notice] = "Something went wrong."
    end
    redirect_to @club
  end
end
