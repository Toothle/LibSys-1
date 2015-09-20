class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Successfully add a book"
      redirect_to @book
    else
      render 'new'
    end
  end

  def book_params
    params.require(:book).permit(:ISBN, :title, :author, :description, :status)
  end

end