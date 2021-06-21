class MessagesController < ApplicationController
  before_action :set_room, only: %i[ new create ]

  def new
    @message = @room.messages.new
  end

  def create
    @message = @room.messages.create!(message_params)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.append(:messages, partial: "messages/message",
          locals: { message: @message })
      end
      format.html { redirect_to @room }
    end
  end

  private
    def set_room
      @room = Room.find(params[:room_id])
    end

    def message_params
      params.require(:message).permit(:body)
    end
end
