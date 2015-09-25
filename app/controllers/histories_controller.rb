class HistoriesController < ApplicationController
  before_action :logged_in_member, only: [:create, :destroy]

  def create()

    flag = TRUE

    @history = current_member.histories.build(book_id: params[:book_id], action: params[:act])

    if params[:member_id] != nil
      @history.member_id = params[:member_id]
    end

    if params[:member_name] != nil
      if Member.find_by_name(params[:member_name]) != nil
        @history.member_id = Member.find_by_name(params[:member_name]).id
      else
        flash[:danger] = "Member does not exist"
        redirect_to member_path(current_member)
        flag = FALSE
      end
    end

    if flag
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
  end

  def index
    @history = current_member.histories      # case 1: index of current_member
    if params[:member_id] != nil      #case 2: index of the other member
      if Member.find(params[:member_id]).histories.any?
        @history = Member.find(params[:member_id]).histories
      else
        flash[:danger] = "No library record found"
        redirect_to member_path(params[:member_id])
      end
    end
  end

  def history_params
    params.require(:history).permit(:action)
  end

end
