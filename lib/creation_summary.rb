class CreationSummary

  delegate :to_json, :to => :data

  def initialize(creation, user)
    @creation = creation
    @user = user
  end

  def data
    case @user
    when Admin
      data_with_estimate
    when Designer
      standard_data
    else
      sanitized_data
    end
  end

  def standard_data
    {
      campaign: @creation.campaign.name,
      client: @creation.client.name,
      designer: @creation.designer.name,
      hours: @creation.hours,
      name: @creation.name,
      project: @creation.project.name,
      revision: @creation.revision,
      stage: @creation.name
    }
  end

  def sanitized_data
    standard_data.reject do |k, v|
      [:hours, :client].include?(k)
    end
  end

  def data_with_estimate
    estimate_data = {
      hours: @creation.estimate.hours,
      rate: @creation.estimate.rate,
      total: @creation.estimate.total
    }
    standard_data.merge(estimate: estimate_data)
  end

end
