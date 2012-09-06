module DesignersHelper
  def designer_status_for(designer = @designer, options = {})
    presenter = DesignerStatus.new(designer, self, options)
    if block_given?
      yield presenter
    else
      presenter
    end
  end
end
