class BooksController < ApplicationController
  
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
  end

  def show
    @book = Book.find(params[:id])
    redirect_to action: :index unless user_signed_in?
  end


  private

  def book_params
    params.require(:book).permit(:name, :category_id, :image).merge(user_id: current_user.id)
  end
end
