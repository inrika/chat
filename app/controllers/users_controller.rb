class UsersController < ApplicationController
  before_action :set_room

  def index
    @users= User.where.not(id:  @room.room_users.select(:user_id))
  end

  def edit
    @user = User.find(params[:id])
    @room_user = @room.room_users.build(user_id: @user.id, room_id: @room.id, moderator: false)
    @room_user.save
    respond_to do |format|
      format.html { redirect_to @room }
      format.js
    end
  end

  private

    def set_room
        @room = Room.find(params[:room_id])
    end

end
