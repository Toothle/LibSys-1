class AdministratorsController < ApplicationController

  before_action :logged_in_administrator, only: [:edit, :update]

  def new
    @administrator = Administrator.new
  end

  def show
    @administrator = Administrator.find(params[:id])
  end

  def create
    @administrator = Administrator.new(administrator_params)
    if @administrator.save
      log_in @administrator
      flash[:success] = "Welcome to the Libraray System!"
      redirect_to @administrator
    else
      render 'new'
    end
  end

  def update
    @administrator = Administrator.find(params[:id])
    if @administrator.update_attributes(administrator_params)

      flash[:success] = "Profile updated"
      redirect_to @administrator
    else
      render 'edit'
    end
  end


  def edit
    @administrator = Administrator.find(params[:id])
  end



  def correct_user
    @administrator = Administrator.find(params[:id])
    redirect_to(root_url) unless @administrator == current_administrator
  end



   private
  def administrator_params
    params.require(:administrator).permit(:name, :email, :password)
  end

  def logged_in_administrator
    unless log_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end




end
