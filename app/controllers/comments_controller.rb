class CommentsController < ApplicationController
	before_action :find_commentable
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    
    @comment = @commentable.comments.new comment_params

    if @comment.save
      redirect_back fallback_location: :back, notice: 'Your comment was successfully posted!'
    else
      redirect_back fallback_location: :back, notice: "Your comment wasn't posted!"
    end
  end

  private

  def comment_params
    defaults = { user_id: current_user.id }
    params.require(:comment).permit(:body).reverse_merge(defaults)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Tweet.friendly.find(params[:tweet_id]) if params[:tweet_id]
  end

end
