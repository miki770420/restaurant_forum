class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
  before_action :authenticate_owner, only: [:update]

  def index
    @users = User.all
  end

  def show
    @commented_restaurants = @user.restaurants.uniq
    @favorited_restaurants = @user.favorited_restaurants
    @followings = @user.followings
    @followers = @user.followers
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "user was successfully updated"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "user was failed to update"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :intro, :email, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def authenticate_owner
    unless current_user == @user
      flash[:alert] = "Not allow!"
      redirect_to user_path(@user)
    end
  end
end
