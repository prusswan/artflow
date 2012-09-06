class DesignersController < ApplicationController
  def index
    @designers = Designer.active
  end

  def show
    @designer = Designer.find(params[:id])
  end
end
