module RoomsHelper

  def is_moderator(room)
    return room.room_users.where(user_id:  current_user.id).first.moderator
  end
  
end
