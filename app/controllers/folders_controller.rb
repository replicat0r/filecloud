class FoldersController < ApplicationController
  before_filter :authenticate_user!

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
    @folder = current_user.folders.find(params[:id])
  end

  def update
    @folder = current_user.folders.find(params[:id])

  end

  def destroy
    @folder = current_user.folders.find(params[:id])

  end

  private
  def folder_params
    params.require(:folder).permit(:name,:parent_id)
  end
end
