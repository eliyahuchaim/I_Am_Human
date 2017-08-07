class MessagesController < ApplicationController

  before_action :set_message_instance, only: [:show, :update, :destroy]

  def index
    @messages = Message.all
    render json: @messages
  end

  def create
    new_message = Message.create(message_params)
    if !new_message.errors.empty?
      render json: {status: "error", code: 400, message: new_message.errors.full_messages[0]}
    else
      render json: new_message
    end
  end

  def show
    render json: @message
  end

  def update
    @message.update(message_params)
    render json: @message
  end

  def destroy
    @message.destroy
    render json: Message.all
  end

  private

    def message_params
      params.require(:message).permit(:chat_id, :content, :user_id)
    end

    def set_message_instance
      @message = Message.find(params[:id])
    end



end
