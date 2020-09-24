class LikesController < ApplicationController
  # before_action :set_variables

  def create
    @like = current_user.likes.create(comment_id: params[:comment_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    # @comment = Comment.find(:params[:comment_id])
    @like = Like.find_by(comment_id: params[:comment_id], user_id: current_user.id )
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end

