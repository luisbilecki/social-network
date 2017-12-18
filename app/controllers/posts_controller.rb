class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:edit, :update, :destroy]

  def index
  end

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to root_path, notice: t("messages.created_with", item:"post")
    else
      redirect_to root_path, alert: t("messages.error_with", item:"post")
    end
  end

  def edit
    respond_to  do | format |
      format.js
      format.html { head :no_content }
    end
  end

  def update
    if @post.update(post_params)
      redirect_to users_index_path, notice: t("messages.update_with", item:"post")
    else
      redirect_to users_index_path, alert: t("messages.update_error", item:"post")
    end
  end

  def destroy
    if @post.destroy
      redirect_to users_index_path, notice: t("messages.delete_with", item:"post")
    else
      redirect_to users_index_path, alert: t("messages.delete_error", item:"post")
    end
  end

  def like
    @post = Post.find(params[:id])
    @post.like_by current_user
    redirect_back(fallback_location: root_path)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :user)
  end
end
