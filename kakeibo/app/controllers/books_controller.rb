class BooksController < ApplicationController
  
  def index
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def new
    @book = Book.new
  end
  
  def create
    book_params =  params.require(:book).permit(:year,:month,:inout,:category,:amount)
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path
    else
      render :new
      flash[:notice] = "error"
    end
  end
  
end