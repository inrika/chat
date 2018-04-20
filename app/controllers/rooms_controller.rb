class RoomsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @room= Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      @visitor = @room.visitors.build(user_id: current_user.id, room_id: @room.id, moderator: true)
      respond_to do |format|
        format.html { redirect_to @room }
        format.js
      end
    else
      respond_to do |format|
        flash[:notice] = {error: ["a chatroom with this topic already exists"]}
        format.html { redirect_to new_room_path }
        format.js { render template: 'chatrooms/chatroom_error.js.erb'}
      end
    end
  end

  def edit
  end

  def update
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
  end

  def index
    @rooms = Room.all
  end

  private
    def room_params
      params.require(:room).permit(:title)
    end

end
