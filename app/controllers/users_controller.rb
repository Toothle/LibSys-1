class UsersController < ApplicationController



  def user_params
    params.require(:user).permit(:ISBN, :title, :author, :description, :status)
  end

  def show

    @user = User.find(params[:id])
  end


  def new
    @user = User.new
  end

  def create
    @user= User.new(user_params)
    if @user.save
      flash[:success] = "Successfully send the suggestion. Please wait for
 processing. Thank you!"
      redirect_to '/'
    else
      render 'new'
    end
  end


  def edit
    @user = User.find(params[:id])
  end



  def index
    @users = User.paginate(page: params[:page])
  end

  def update

    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Successfully edit the suggested book"
      redirect_to user_path(@user)
    else
      render 'edit'
    end

  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Suggest denied"
    redirect_to users_url
  end


end
