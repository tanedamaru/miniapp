class PostingsController < ApplicationController

  before_action :move_to_index, except: :index

  def index
    @postings = Posting.includes(:user).order("created_at DESC").page(params[:page]).per(10)
  end

  def new
  end

  def create
    Posting.create(text: posting_params[:text], user_id: current_user.id)
  end

  def destroy
    posting = Posting.find(params[:id])
    posting.destroy if posting.user_id == current_user.id
  end

  def edit
    @posting = Posting.find(params[:id])
  end

  def update
    posting = Posting.find(params[:id])
    if posting.user_id == current_user.id
      posting.update(posting_params)
    end
  end

  def show
    @posting = Posting.find(params[:id])
    @comments = @posting.comments.includes(:user)
  end

  private
  def posting_params
    params.permit(:text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end

