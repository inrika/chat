class MessagesChannel < ApplicationCable::Channel
  def subscribed
     stream_from "messages"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    Message.create(user: current_user, room_id: data["room_id"], body: data["message"])
  end

end
