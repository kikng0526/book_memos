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
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true)
  end

  def search
    @q = book.search(search_params)
    @books = @q.result(distinct: true)
  end

  def show
    @book = Book.find(params[:id])
    redirect_to action: :index unless user_signed_in?
  end


  private

  def book_params
    params.require(:book).permit(:name, :category_id, :image).merge(user_id: current_user.id)
  end

  def search_params
    params.require(:q).permit!
  end
end
