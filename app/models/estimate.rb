class Estimate < ActiveRecord::Base
  def total
    if hours && rate
      hours * rate
    end
  end
end
