class HistoriesController < ApplicationController
  before_action :logged_in_member, only: [:create, :destroy]

  def create()

    flag = TRUE

    @history = current_member.histories.build(book_id: params[:book_id], action: params[:act])

    if params[:member_id] != nil
      @history.member_id = params[:member_id]
    end

    if params[:member_email] != nil
      if Member.find_by_email(params[:member_email]) != nil
        @history.member_id = Member.find_by_email(params[:member_email]).id
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
      book = Book.find(params[:book_id])
      book.update_attribute(:status, params[:act])

      if book.member_id != nil && params[:act] == "available"      # email the member who register the book
        Notifier.book_available(Member.find(book.member_id)).deliver_now
        book.update_attribute(:member_id, nil)
      end

    else
      flash[:danger] = "Fail"
      redirect_to member_path(current_member)
    end
    end
  end

  def index
    # @history = current_member.histories      # case 1: index of current_member
    # if params[:member_id] != nil      #case 2: index of the other member
      if Member.find(params[:member_id]).histories.any?
        @history = Member.find(params[:member_id]).histories
      else
        flash[:danger] = "No library record found"
        redirect_to member_path(params[:member_id])
      end
    # end
  end

  def history_params
    params.require(:history).permit(:action)
  end

end
