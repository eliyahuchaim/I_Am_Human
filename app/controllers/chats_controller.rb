class ChatsController < ApplicationController

  before_action :set_chat_instance, only: [:show, :update, :destroy]

  def index
    @chats = Chat.all
    render json: @chats
  end

  def create
    new_chat = Chat.create(chat_params)
    if !new_chat.errors.empty?
      render json: {status: "error", code: 400, message: new_chat.errors.full_messages[0]}
    else
      render json: new_chat
    end
  end

  def show
    render json: @chat
  end

  def update
    @chat.update(chat_params)
    render json: @chat
  end

  def destroy
    @chat.destroy
    render json: Chat.all
  end

  private

    def chat_params
      params.require(:chat).permit(:name)
    end

    def set_chat_instance
      @chat = Chat.find(params[:id])
    end

end
