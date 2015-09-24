class HistoriesController < ApplicationController
  before_action :logged_in_member, only: [:create, :destroy]

  def create()
    @history = current_member.histories.build(book_id: params[:book_id], action: params[:act])
    if @history.save
      flash[:success] = "Success"
      redirect_to member_path(current_member)
      @book = Book.find(params[:book_id])
      @book.update_attribute(:status, params[:act])
    else
      flash[:danger] = "Fail"
      redirect_to member_path(current_member)
    end
  end

  def index
    @history = current_member.histories
  end

  def history_params
    params.require(:history).permit(:action)
  end

end
