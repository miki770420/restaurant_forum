class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :intro, :email, :avatar)
  end
end
