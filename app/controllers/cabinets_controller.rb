class CabinetsController < ApplicationController
  before_filter :authenticate_user!  #authenticate for users before any methods is called

  def index
    @cabinets = current_user.cabinets
  end

  def show
    @cabinet = current_user.cabinets.find(params[:id])
  end

  def new
    @cabinet = current_user.cabinets.new

    if params[:folder_id]
      @current_folder = current_user.folders.find(params[:folder_id])
      @cabinet.folder_id = @current_folder.id
    end
  end

  def create
    @folder_id = params[:cabinet][:folder_id]

    @cabinet = current_user.cabinets.build(uploaded_file: params[:file])
    @cabinet.folder_id = @folder_id
    #flash[:notice] = "Successfully uploaded the file."
    if @cabinet.save
      respond_to do |format|
        format.json{ render :json => @cabinet }
      end


      # if @cabinet.folder
      #   redirect_to browse_path(@cabinet.folder)
      # else

      #   redirect_to root_path
      # end

    else
      render :action => 'new'

    end
  end

  def get
    cabinet = current_user.cabinets.find_by_id(params[:id])
    if cabinet
      send_file cabinet.uploaded_file.path, :type => cabinet.uploaded_file_content_type

    else
      flash[:error] = "Don't be cheeky! Mind your own assets!"
      redirect_to root_path
    end

  end

  def edit
    @cabinet = current_user.cabinets.find(params[:id])
  end

  def update
    @cabinet = current_user.cabinets.find(params[:id])

  end

  def destroy
    @cabinet = current_user.cabinets.find(params[:id])
    @parent_folder = @cabinet.folder
    @cabinet.destroy
    flash[:notice] = "Successfully deleted the file."
    if @parent_folder
      redirect_to browse_path(@parent_folder)
    else
      redirect_to root_path
    end


  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def cabinet_params
    params.require(:cabinet).permit(:folder_id)
  end
end
