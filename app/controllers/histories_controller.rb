class HistoriesController < ApplicationController

  def new
    @history = History.new()
  end

  def create
    @history = History.new(book_params)
    if @history.save
      flash[:success] = "Book added"
      redirect_to @book
    else
      render 'new'
    end
  end

  def history_params
    params.require(:history).permit(:action, )
  end

  def index
    @history = History
  end

end
