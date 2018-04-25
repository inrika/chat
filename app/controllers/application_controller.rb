class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :current_user, :log_in, :log_out, :logged_in?

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

  protected

    def authenticate_user!
  #    logger.info  "Результат"
      redirect_to root_path unless logged_in?
    end
end
