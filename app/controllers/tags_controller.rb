class TagsController < ApplicationController

  before_action :set_instance, only: [:show, :update, :destroy]

  def index
    @tags = Tag.all
    render json: @tags
  end

  def create
    new_tag = Tag.create(tag_params)
    if !new_tag.errors.empty?
      render json: {status: "error", code: 400, message: new_tag.errors.full_messages[0]}
    else
      render json: new_tag
    end
  end

  def show
    # set_instance is called before this action, so @tag will be set appropriately
    render json: @tag
  end

  def update
    @tag.update(tag_params)
    render json: @tag
  end

  def destroy
    @tag.destroy
    render json: Tag.all
  end

  private

  def tag_params
    params.require(:tag).permit(:category_id, :thought_id)
  end

  def batch_tag_params
    params.require(:tags).permit(:category_id, :thought_id)
  end

  def set_instance
    @tag = Tag.find(params[:id])
  end

end
