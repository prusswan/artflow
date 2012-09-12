class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_creation

  def create
    @comment = @creation.comments.new(params[:comment])
    @comment.user = current_user
    @comment.save!
    respond_to do |format|
      format.html do
        redirect_to comments_url
      end
      format.js
    end
  end

  private
    def find_creation
      @creation = Creation.find(params[:creation_id])
    end
end
