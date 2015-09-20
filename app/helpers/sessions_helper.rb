module SessionsHelper

  #登录进入指定的admin
  def log_in(administrator)
    session[:administrator_id] = administrator.id
  end


  #返回当前登录的admin
  def current_administrator
    @current_administrator ||= Administrator.find_by(id: session[:administrator_id])
  end


  #如果admin已登录返回true，否则false
  def log_in?
  !current_administrator.nil?
  end

  def log_out
    session.delete(:administrator_id)
    @current_administrator = nil
  end

end
