class FoldersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :js, :html

  def index
    @folders = current_user.folders
  end

  def show
    @folder = current_user.folders.find(params[:id])


  end

  def new
    @folder = current_user.folders.new

    if params[:folder_id]
      @current_folder = current_user.folders.find(params[:folder_id])
      @folder.parent_id = @current_folder.id
    end

  end

  def create
    @folder = current_user.folders.build(folder_params)

    if params[:folder_id]
      @current_folder = current_user.folders.find(params[:folder_id])
      @folder.parent_id = @current_folder.id
    end
    if @folder.save
      flash[:notice] = "Successfully created folder."
      if @folder.parent
        redirect_to browse_path(@folder.parent)
      else
        redirect_to root_path
      end
    else
      render 'new'
    end

  end

  def edit
    @folder = current_user.folders.find(params[:folder_id])
    @current_folder = @folder.parent
  end

  def update
    @folder = current_user.folders.find(params[:folder_id])
    #@folder.update_attributes(folder_params)
    @parent_folder = @folder.parent

    respond_to do |format|
      if @folder.update_attributes(folder_params)

        format.html { redirect_to(@folder, :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(@folder) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@folder) }
      end
    end

    # if @parent_folder
    #   redirect_to browse_path(@parent_folder)

    # else
    #   redirect_to root_path
    # end
  end

  def destroy
    @folder = current_user.folders.find(params[:id])
    @parent_folder = @folder.parent
    @folder.destroy
    flash[:notice] = "Successfully deleted the folder and all the contents inside."

    if @parent_folder
      redirect_to browse_path(@parent_folder)

    else
      redirect_to root_path
    end

  end

  private
  def folder_params
    params.require(:folder).permit(:name,:parent_id)
  end
end
