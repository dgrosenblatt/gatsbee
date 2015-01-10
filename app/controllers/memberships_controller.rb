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

  def destroy
    @membership = Membership.find(params[:id])
    @club = @membership.club
    if @membership.user == current_user && @club.organizer != current_user
      @membership.destroy
    end
    redirect_to clubs_path, notice: "You have left #{@club.name}"
  end
end
