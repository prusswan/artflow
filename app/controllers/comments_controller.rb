class CommentsController < ApplicationController
  before_filter :authenticate_user!, unless: :is_mobile_device?
  before_filter :find_creation

  def index
    @comments = @creation.comments
  end

  def create
    @comment = @creation.comments.new(params[:comment])
    @comment.user = current_user
    @comment.save!

    respond_to do |format|
      format.mobile do
        redirect_to creation_comments_url(@creation)
      end
      format.js
    end
  end

  private
    def find_creation
      @creation = Creation.find(params[:creation_id])
      @project = @creation.project if is_mobile_device?
    end
end
