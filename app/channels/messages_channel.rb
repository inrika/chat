class MessagesChannel < ApplicationCable::Channel
  def subscribed
     stream_from "messages"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    room = Room.find(data["room_id"])
    #byebug
    if !room.room_users.where(user_id:  current_user.id).first.mute
      Message.create!(user: current_user, room_id: data["room_id"], body: data["message"])
    end
  end

end
