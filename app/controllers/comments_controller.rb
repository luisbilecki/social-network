class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
  end

  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to root_path, notice: t("messages.created_with", item:"comment")
    else
      redirect_to root_path, alert: t("messages.error_with", item:"comment")
    end
  end

  def edit
    respond_to  do | format |
      format.js
      format.html { head :no_content }
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to root_path, notice: t("messages.update_with", item:"comment")
    else
      redirect_to root_path, alert: t("messages.update_error", item:"comment")
    end
  end

  def destroy
    if @comment.destroy
      redirect_to root_path, notice: t("messages.delete_with", item:"comment")
    else
      redirect_to root_path, alert: t("messages.delete_error", item:"comment")
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
