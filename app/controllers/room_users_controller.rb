class RoomUsersController < ApplicationController
  before_action :set_room
  def create
    @user = User.find(params[:id])
    @room_user = @room.room_users.build(user_id: @user.id, room_id: @room.id, moderator: false)
    @room_user.save
    respond_to do |format|
      format.html { redirect_to @room }
      format.js
    end
  end

  def update

    @room_user = RoomUser.find(params[:id])
    @room_user.set_moderator
    redirect_to room_path(@room)
  end

  def destroy
    @room_user= RoomUser.find(params[:id])
    @room_user.destroy
    redirect_to room_path(@room)
  end

  def set_room
      @room = Room.find(params[:room_id])
  end

end
