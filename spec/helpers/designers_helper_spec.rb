require 'spec_helper'

describe DesignersHelper do
  before do
    setup_designer
    @status = DesignerStatus.new(@designer, nil)
  end

  it 'designer_status_for helper returns a DesignerStatus instance' do
    designer_status_for(@designer).should be_kind_of(DesignerStatus)
  end

  it 'designer_status_for helper yields a DesignerStatus instance' do
    yielded = nil
    designer_status_for(@designer) { |obj| yielded = obj }
    yielded.should be_kind_of(DesignerStatus)
  end

  it 'calling to_s returns status markup' do
    status = designer_status_for(@designer)
    status.to_s.should include('<title>Status</title>')
  end

  it 'non-expanded status markup does not include active hours' do
    status = designer_status_for(@designer)
    status.to_s.should_not include('Active Project Hours')
  end

  it 'expanded status markup includes active hours' do
    status = designer_status_for(@designer, expanded: true)
    status.to_s.should include('Active Project Hours')
  end
end
