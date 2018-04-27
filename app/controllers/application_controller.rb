class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_user, :log_in, :log_out, :logged_in?, :is_mute

  def current_user
      @current_user ||= User.find(cookies.signed[:user_id]) if cookies.signed[:user_id]
  end

  def log_in(user_id)
    cookies.signed[:user_id] = user_id
  end

  def logged_in?
    !!current_user
  end

  def log_out
    cookies.delete :user_id
    @current_user = nil
  end

  def is_mute(room_id)
    room = Room.find(room_id)
    room.room_users.where(user_id:  current_user.id).first.mute
  end

  protected
    def authenticate_user!
      redirect_to root_path unless logged_in?
    end
end
