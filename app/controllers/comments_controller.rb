class CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    @club = Club.find(params[:club_id])
    @comment = Comment.new(comment_params)
    @comment.club = @club
    @comment.user = current_user
    @comment.book = @club.current_book unless @club.current_book.nil?
    if @comment.save
      redirect_to @club, notice: "Comment Saved"
    else
      @comments = @club.comments
      @errors = @comment.errors.full_messages
      @membership = Membership.find_by(user_id: current_user.id,
                                       club_id: @club.id)
      render 'clubs/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @club = @comment.club
    if @comment.user == current_user
      @comment.destroy
      flash[:notice] = "Comment Deleted"
    else
      flash[:notice] = "You can't delete that comment"
    end
    redirect_to @club
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :kind)
  end
end
