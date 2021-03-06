class UsersController < ApplicationController

  before_action :set_instance, only: [:show, :update, :destroy]

  def index
    @users = User.all
    render json: @users
  end

  def create
    new_user = User.create(user_params)
    if !new_user.errors.empty?
      render json: {status: "error", code: 400, message: new_user.errors.full_messages[0]}
    else
      render json: new_user
    end
  end

  def show
    # set_instance is called before this action, so @user will be set appropriately
    render json: @user
  end

  def update
    @user.update(user_params)
    render json: @user
  end

  def destroy
    @user.destroy
    render json: User.all
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

  def set_instance
    @user = User.find(params[:id])
  end

end
