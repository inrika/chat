class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  def new
    @user=User.new
  end

  def create
    user=User.find_by(user_params)
    if user
      log_in (user.id)
      redirect_to root_path
    else
      redirect_to login_path, flash[:notice] =  user.errors.messages
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:nickname)
    end
end
