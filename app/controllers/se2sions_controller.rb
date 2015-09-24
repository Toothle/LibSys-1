class Se2sionsController < ApplicationController
  def new
  end
  def create
    member = Member.find_by(email: params[:se2sion][:email].downcase)
    if member && (member[:password]==(params[:se2sion][:password]))
      log_in member
      redirect_to member
    else
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end
  def destroy
    log_out
    redirect_to root_url
  end
end