class FollowersController < ApplicationController
  before_action :authenticate_user!

  def follow
    @f = Follower.new
    @f.current = current_user
    @f.follower = User.find(params[:id])

    if @f.save!
        redirect_to root_path, notice: "Yay! You're following #{@f.follower.name}"
    else
        redirect_to root_path, error: "Error during following the profile #{@f.follower.name}"
    end

  end

  def unfollow
    @f = Follower.find(params[:id])
    if @f.destroy
        redirect_to root_path, notice: "Ok! Unfollow concluded successfully!"
    else
        redirect_to root_path, error: "Error during unfollow process"
    end
  end
end
