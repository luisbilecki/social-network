class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @posts = Post.by_user(current_user, params[:page])
  end

  def search
    cookies[:search_t] = params[:q]
    if params[:q].blank?
      @users = User.filter_all(params[:page])
    else
      @users = User.search(params[:q], params[:page])
    end
  end

  def show
     @user = User.friendly.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :about, :avatar, :avatar_cache,
                                 :remove_avatar,:q)
  end

end
