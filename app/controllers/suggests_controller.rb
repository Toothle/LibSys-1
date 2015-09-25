class SuggestsController < ApplicationController


  def show

    @suggest = Suggest.find(params[:id])
  end


  def new
    @suggest = Suggest.new
  end
end
