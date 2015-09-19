class BooksController < ApplicationController
  def new
  end

  def show
    @book = Book.find(params[:id])
  end
end