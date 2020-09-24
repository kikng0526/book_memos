class UsersController < ApplicationController
  def show
    # @user = User.find_by(params[:id])
    @books = current_user.books
    @book = Book.find_by(params[:id])
    # book = current.user.books
  end

  
end
