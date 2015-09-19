class SessionsController < ApplicationController
  def new
  end


  def create
    administrator = Administrator.find_by(email: params[:session][:email].downcase)
    if administrator && (params[:session][:password].downcase).equal?(administrator[password])
      #登入用户
    else
      #创建一个错误消息
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end


    def destroy
    end



  end



end
