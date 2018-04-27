class RoomUser < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def set_moderator
    moderator = true
    save
  end
end
