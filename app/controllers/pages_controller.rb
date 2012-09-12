class PagesController < ApplicationController
  before_filter :redirect_mobile

  def home
  end

  private
    def redirect_mobile
      if is_mobile_device?
        redirect_to project_creations_path(Project.first)
      end
    end
end
