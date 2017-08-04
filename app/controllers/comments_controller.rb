class CommentsController < ApplicationController

  before_action :set_instance, only: [:show, :update, :destroy]

  def index
    @comments = Comment.all
    render json: @comments
  end

  def create
    new_comment = Comment.create(comment_params)
    if !new_comment.errors.empty?
      render json: {status: "error", code: 400, message: new_comment.errors.full_messages[0]}
    else
      render json: new_comment
    end
  end

  def show
    # set_instance is called before this action, so @comment will be set appropriately
    render json: @comment
  end

  def update
    @comment.update(comment_params)
    render json: @comment
  end

  def destroy
    @comment.destroy
    render json: Comment.all
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :thought_id, :user_id)
  end

  def set_instance
    @comment = Comment.find(params[:id])
  end

end
