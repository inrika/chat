class MessagesController < ApplicationController
# теперь не нужен контроллер
  def create
#    @message = Message.new(message_params) -
  end

  private
    def message_params
      params.require(:message).permit(:body, :room_id, :user_id)
    end

end
