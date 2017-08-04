class CategoriesController < ApplicationController

  before_action :set_instance, only: [:show, :update, :destroy]

  def index
    @categories = Category.all
    render json: @categories
  end

  def create
    new_category = Category.create(category_params)
    if !new_category.errors.empty?
      render json: {status: "error", code: 400, message: new_category.errors.full_messages[0]}
    else
      render json: new_category
    end
  end

  def show
    # set_instance is called before this action, so @category will be set appropriately
    render json: @category
  end

  def update
    @category.update(category_params)
    render json: @category
  end

  def destroy
    @category.destroy
    render json: Category.all
  end

  private

  def category_params
    params.require(:category).permit(:name, :image_url)
  end

  def set_instance
    @category = Category.find(params[:id])
  end

end
