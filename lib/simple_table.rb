class SimpleTable

  attr_reader :columns

  delegate :each, to: :@records

  def initialize(template, records, columns = {}, options = {})
    @template = template
    @records  = records
    @columns  = columns
    @options  = options
  end

  def values(record)
    @columns.each_with_object({}) do |(title, extractor), memo|
      memo[title] = extract_value(record, extractor)
    end
  end

  def to_s
    @template.render partial: 'presenters/simple_table', object: self
  end

  private
    def extract_value(record, extractor)
      if extractor.respond_to?(:call)
        extractor.call(record)
      else
        record.send(extractor)
      end
    end

end
