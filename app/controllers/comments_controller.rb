class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    ActionCable.server.broadcast 'message_channel', content: comment if comment.save
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      redirect_to "/books/#{comment.book.id}"
    else
      render :show
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, book_id: params[:book_id], user_nickname: current_user.nickname, likes_count: params[:likes_count])
  end
end
