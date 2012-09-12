class DesignersController < ApplicationController
  def index
    @designers = Designer.active
  end

  def show
    @designer = Designer.find(params[:id])

    respond_to do |format|
      format.any { render :show, formats: :html }
    end
  end
end
