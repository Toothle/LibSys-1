class MembersController < ApplicationController
  before_action :logged_in_member, only: [:index, :edit, :update, :destroy]
  before_action :correct_member, only: [ :edit, :update]
  before_action :admin_member, only: [:index, :destroy]

  def new
    @member = Member.new
  end

  def show
    @member = Member.find(params[:id])
    @histories = @member.histories.paginate(page: params[:page])
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      if current_member != nil && current_member.admin?
        flash[:success] = "Member #{@member.name} added"
        redirect_to members_path
      else
        flash[:success] = "Welcome to Library System"
        log_in @member
        redirect_to @member
      end
    else
      render 'new'
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(member_params)
      flash[:success] = "Profile updated"
      redirect_to @member
    else
      render 'edit'
    end
  end


  def index
    @members = Member.paginate(page: params[:page])
  end


  def destroy
    member_history = Member.find(params[:id]).histories
    check = 0
    ret = 0

    if member_history.any?
      member_history.each do |history|
        (history.action == "checkout") ? check += 1: ret += 1
      end
      if check > ret
        flash[:danger] = "Cannot delete: this member has books need to be returned"
        redirect_to members_url
      else
        Member.find(params[:id]).destroy
        flash[:success] = "Member deleted"
        redirect_to members_url
      end
    else
      Member.find(params[:id]).destroy
      flash[:success] = "Member deleted"
      redirect_to members_url
    end
  end

  def admin_member
    redirect_to(root_url) unless current_member.admin?
  end
  
  def find_book
    if params[:search]
      if params[:classify] == "ISBN" || params[:classify] == "title" || params[:classify] == "author" || params[:classify] == "description" || params[:classify] == "status"
        @books = Book.where("#{params[:classify]} LIKE ?", "%#{params[:search]}%")
      else
        flash[:danger] = "Can not search by #{params[:classify]}"
        redirect_to searchbook_path
      end
    end
  end

  def add_admin
    @member = Member.new
  end

private

  def member_params
    params.require(:member).permit(:name, :email, :password,:admin) #保存相应的value
  end 

  def logged_in_member
    unless logged_in?
      flash[:danger] = "Please log in."
        redirect_to login_url
    end
  end


  def correct_member
    @member = Member.find(params[:id])
    redirect_to(root_url) unless @member == current_member
  end

end
