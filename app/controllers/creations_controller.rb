class CreationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @creations = Creation.all
  end

  def show
    @creation = Creation.find(params[:id])
  end

  def create
    @creation = Creation.new(params[:creation])
    if @creation.save
      flash[:notice] = "Creation added!"
      redirect_to @creation
    else
      flash.now[:alert] = "Could not save creation!"
      render action: 'new'
    end
  end

  def permissions
    @creation = Creation.find(params[:id])
  end
end
