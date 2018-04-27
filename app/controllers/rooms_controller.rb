class RoomsController < ApplicationController
#  skip_before_action :authenticate_user!
  def new
    @room= Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      @room_user = @room.room_users.build(user_id: current_user.id, room_id: @room.id, moderator: true, mute: false)
      @room_user.save
      logger.info @room_user
      respond_to do |format|
        format.html { redirect_to @room }
        format.js
    end
    else
      respond_to do |format|
        flash[:notice] = {error: ["Комната с таким названием существует"]}
        format.html { redirect_to new_room_path }
      end
    end
  end

  def edit
  end

  def update
  end

  def show
    @room = Room.find(params[:id])
    @users = @room.room_users
    @message = Message.new
  end

  def index
    #@rooms = Room.all
    @rooms = current_user.rooms
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to rooms_path
  end

  private
    def room_params
      params.require(:room).permit(:title)
    end

end
