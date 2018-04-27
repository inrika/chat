class RoomUser < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def set_moderator
    self.moderator = true
    self.save
  end

  def set_mute (mt)
    #self.mute = !self.mute
    self.mute = mt
    self.save
  end
end
