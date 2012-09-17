class ApplicationController < ActionController::Base
  protect_from_forgery

  has_mobile_fu

  use_vanity :current_user

  before_filter :set_request_format
  before_filter :set_expanded_view

  helper_method :current_user

  # NOTE: We stub out the current user of the application so that you
  # can easily run the example code discussed in the chapters.
  #
  # In a real, full fledged application we'd remove this and authenticate
  # using Devise, etc.
  def current_user
    # Designer.first
    current_designer
  end

  def authenticate_user!
    #authenticate_designer!
  end

  # NOTE: We stub out this personal preference so creation thumbnails
  # are expanded
  def set_expanded_view
    session[:view] = 'expanded'
  end

  def set_request_format
    request.format = :mobile if is_mobile_device? # && !request.xhr?
  end
end
