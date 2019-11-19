class UsersController < ApplicationController
  before_action :set_user, only:[:show,:edit,:delete,:update]
  def show
  end

  def edit
  end

  def delete
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:picture,:admin)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
