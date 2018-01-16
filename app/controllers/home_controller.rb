class HomeController < ApplicationController

  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def index
    @user = User.new

    unless current_user.blank?
      following_list = current_user.following
      @following =  following_list.order(:created_at).limit(6)

      values =  following_list.pluck(:follower_id)
      @posts = Post.subscribed(values, params[:page])
    end
  end



end
