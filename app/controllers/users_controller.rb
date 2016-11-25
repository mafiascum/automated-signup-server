# Controller to manage our user resource and login users
class UsersController < ApplicationController
  skip_before_action :authenticate, only: :authenticate_with_sid
  load_and_authorize_resource except: :authenticate_with_sid

  def index
    respond_with @users
  end

  def update
    if @user.update_attributes(update_params)
      head :ok
    else
      render json: {error: @user.errors}, status: :bad_request
    end
  end

  def reset_token
    @user.regenerate_token
    head :ok
  end

  def authenticate_with_sid
  end

  private

  def update_params
    params.require(:user).permit(:role)
  end
end
