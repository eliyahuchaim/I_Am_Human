class ThoughtsController < ApplicationController

  before_action :set_instance, only: [:show, :update, :destroy]

  def index
    @thoughts = Thought.all
    render json: @thoughts
  end

  def create
    new_thought = Thought.create(thought_params)
    # new_thought.update(user_id: user_id_params[:id])
    if new_thought.id != nil
      render json: new_thought
    else
      render json: {}
    end
  end

  def show
    # set_instance is called before this action, so @thought will be set appropriately
    render json: @thought
  end

  def update
    @thought.update(thought_params)
    render json: @thought
  end

  def destroy
    @thought.destroy
    render json: Thought.all
  end

  private

  def thought_params
    params.require(:thought).permit(:title, :content, :likes, :views, :user_id)
  end

  # def user_id_params
  #   params.require(:thought).require(:user_id).permit(:id, :username)
  # end

  def set_instance
    @thought = Thought.find(params[:id])
  end

end
