class CommentsController < ApplicationController

  def new
    @posting = Posting.new
    @comment = Comment.new
  end

  def create
    Comment.create(comment_params)
    redirect_to controller: :postings, action: :index
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(posting_id: params[:posting_id],user_id: current_user.id)
  end

end
