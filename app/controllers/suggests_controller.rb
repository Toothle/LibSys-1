class SuggestsController < ApplicationController


  def show

    @suggest = Suggest.find(params[:id])
  end


  def new
    @suggest = Suggest.new
  end

  def create
    @suggest= Suggest.new(suggest_params)
    if @suggest.save
      flash[:success] = "Successfully send the suggestion. Please wait for
 processing. Thank you!"
    redirect_to '/'
    else
    render 'new'
  end
end


  def edit
    @suggest = Suggest.find(params[:id])
  end


  def suggest_params
    params.require(:suggest).permit(:ISBN, :title, :author, :description, :status)
  end

  def index
    @suggests = Suggest.paginate(page: params[:page])
  end


end
