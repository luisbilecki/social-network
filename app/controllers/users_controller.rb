class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:edit, :update]

  def index
    @user = current_user
    @posts = Post.by_user(current_user, params[:page])
  end

  def edit
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:name, :about, :avatar, :avatar_cache,
                                 :remove_avatar)
  end

  def set_profile

  end

end
