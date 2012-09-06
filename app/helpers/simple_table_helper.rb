module SimpleTableHelper
  def simple_table_for(records, columns = {}, options = {})
    presenter = SimpleTable.new(self, records, columns, options)
    if block_given?
      yield presenter
    else
      presenter
    end
  end
end
