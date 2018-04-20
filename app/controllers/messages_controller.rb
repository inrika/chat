class MessagesController < ApplicationController
  skip_before_action :authenticate_user!
  def create
    @message = Message.new(message_params)
    @message.user=current_user
    if @message.save
#      redirect_to room_path(@message.room_id)
    else
      redirect_to rooms_path
    end
  end

  private
    def message_params
      params.require(:message).permit(:body, :room_id)
    end

end