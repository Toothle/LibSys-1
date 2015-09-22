class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def show
    @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      flash[:success]="Welcome to LibSys!"
      redirect_to @member
    else
       render 'new'
    end
  end
  
  def member_params
    params.require(:member).permit(:name,:email,:password)
  end
end
