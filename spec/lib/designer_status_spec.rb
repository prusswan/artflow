require 'spec_helper'

describe DesignerStatus do
  before do
    setup_designer
    @status = DesignerStatus.new(@designer, nil)
  end

  it 'DesignerStatus instance calculates active projects' do
    @status.active_projects_count.should eql(3)
  end

  it 'DesignerStatus instance calculates hours' do
    @status.hours_per_project.values.should eql([2, 2, 2])
    @status.active_hours.should eql(6)
  end
end
