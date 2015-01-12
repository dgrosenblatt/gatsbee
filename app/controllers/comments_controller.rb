class CommentsController < ApplicationController
  def create
    @club = Club.find(params[:club_id])
    @comment = Comment.new(comment_params)
    @comment.club = @club
    @comment.user = current_user
    if @comment.save
      redirect_to @club, notice: "Comment Saved"
    else
      @membership = Membership.find_by(user_id: current_user.id,
                                       club_id: @club.id)
      render 'clubs/show'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :kind)
  end
end
