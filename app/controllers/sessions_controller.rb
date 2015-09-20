class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end


  def create
    administrator = Administrator.find_by(email: params[:session][:email].downcase)
    if administrator && (params[:session][:password].downcase == administrator.password)

      #登入admin
      log_in administrator
      redirect_to administrator


    else
      #创建一个错误消息
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
