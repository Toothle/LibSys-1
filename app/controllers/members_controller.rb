class MembersController < ApplicationController
  before_action :logged_in_member, only: [:edit, :update]
  before_action :correct_member, only: [:edit, :update]
  def new
    @member = Member.new
  end
  def show
    @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      log_in @member
      flash[:success]="Welcome to LibSys!"
      redirect_to @member
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
  

  def member_params
    params.require(:member).permit(:name,:email,:password)
  end
  
  def logged_in_member
    unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end
  def correct_member
      @member = Member.find(params[:id])
      redirect_to(root_url) unless @member == current_member
  end
end
