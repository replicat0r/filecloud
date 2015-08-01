class CabinetsController < ApplicationController
  before_filter :authenticate_user!  #authenticate for users before any methods is called

  def index
  end



  def index
    @cabinets = current_user.cabinets
  end

  def show
    @cabinet = current_user.cabinets.find(params[:id])
  end

  def new
    @cabinet = current_user.cabinets.new
  end

  def create
    @cabinet = current_user.cabinets.create(cabinet_params)
    redirect_to :back


  end

  def edit
    @cabinet = current_user.cabinets.find(params[:id])
  end

  def update
    @cabinet = current_user.cabinets.find(params[:id])

  end

  def destroy
    @cabinet = current_user.cabinets.find(params[:id])

  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def cabinet_params
    params.require(:cabinet).permit(:uploaded_file)
  end
end
