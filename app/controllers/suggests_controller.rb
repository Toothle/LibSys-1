class SuggestsController < ApplicationController



  def suggest_params
    params.require(:suggest).permit(:ISBN, :title, :author, :description, :status)
  end

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



  def index
    @suggests = Suggest.paginate(page: params[:page])
  end

  def update

    @suggest = Suggest.find(params[:id])
    if @suggest.update_attributes(suggest_params)
      flash[:success] = "Successfully edit the suggested book"
      redirect_to @suggests
    else
      render 'edit'
    end

  end

  def destroy
    Suggest.find(params[:id]).destroy
    flash[:success] = "Suggest denied"
    redirect_to suggests_url
  end





end
