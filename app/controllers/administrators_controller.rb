class AdministratorsController < ApplicationController
  def new
  end

  def show
    @administrator = Administrator.find(params[:id])

  end

end
