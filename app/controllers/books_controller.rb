class BooksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    binding.pry
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:name,:category_id, :image)
  end
end
