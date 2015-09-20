class AdministratorsController < ApplicationController
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

  private
  def administrator_params
    params.require(:administrator).permit(:name, :email, :password,
                                         )
  end

end
