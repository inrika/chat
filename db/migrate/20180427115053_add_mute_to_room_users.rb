class AddMuteToRoomUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :room_users, :mute, :boolean
  end
end
