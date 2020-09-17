class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    if comment.save
      ActionCable.server.broadcast 'message_channel', content: comment
    end
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
    params.require(:comment).permit(:text).merge(user_id: current_user.id, book_id: params[:book_id])
  end
end
