class CreationsController < ApplicationController
  before_filter :authenticate_user!, unless: :is_mobile_device?
  before_filter :find_creation, :only => [:show, :edit, :update, :destroy, :permissions]

  def index
    unless is_mobile_device?
      @creations = Creation.all
    else
      # Note: for this example we will just grab the first project's
      # creations
      @project = Project.first
      @creations = @project.creations
    end
  end

  def new
    @creation = Creation.new
  end

  def create
    @creation = Creation.new(params[:creation])
    # STUB: Since we're just illustrating how to build the form, we're
    # just assigning the first project here. In a fully fledged app,
    # this information would either comefrom a
    # mare camplex form that supports selecting the client and
    # project, ar a form that supported adding the creation from the
    # specific project context.
    @creation.project = Project.first
    @creation.designer = current_user

    if @creation.save
      flash[:notice] = "Creation added!"
      redirect_to @creation
    else
      flash.now[:alert] = "Could not save creation!"
      render action: 'new'
    end
  end

  def show
    @client = @creation.project.client
    respond_to do |format|
      format.json do
        render :json => CreationSummary.new(@creation, current_user).to_json
      end
      format.html
    end
  end

  def edit

  end

  def update
    if @creation.update_attributes(params[:creation])
      flash[:notice] = "Creation has been updated."
      redirect_to @creation
    else
      flash[:alert] = "Creation has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @creation.destroy
    flash[:notice] = "Creation has been deleted."
    redirect_to creations_path
  end

  def permissions

  end

  private
    def find_creation
      @creation = Creation.find(params[:id])
      @project = @creation.project if is_mobile_device?
      rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The creation you were looking for could not be found."
      redirect_to creations_path
    end
end
