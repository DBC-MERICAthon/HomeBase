class UsersController < ApplicationController
  def index
  end

  def create
  end

  def new
  end

  def edit
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    p params
    @user.update(user_params)
    @user.save
    redirect_to "/users/#{@user.id}"
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :nickname,
      :email,
      :phone,
      :birthdate,
      :image_url)
  end
end
