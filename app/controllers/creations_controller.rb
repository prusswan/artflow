class CreationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @creations = Creation.all
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

    if @creation.save
      flash[:notice] = "Creation added!"
      redirect_to @creation
    else
      flash.now[:alert] = "Could not save creation!"
      render action: 'new'
    end
  end

  def show
    @creation = Creation.find(params[:id])
  end

  def permissions
    @creation = Creation.find(params[:id])
  end
end
