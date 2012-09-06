require 'spec_helper'

describe CreationSummary do
  before do
    @creation = FactoryGirl.create(:creation)
    @client = @creation.client
    @designer = @creation.designer
    @admin = FactoryGirl.create(:admin)
  end

  it "an admin sees data including the estimate" do
    summary = CreationSummary.new(@creation, @admin)
    fields = [:campaign, :client, :designer,
              :hours, :name, :project, :revision, :stage,
              :estimate]
    assert_serializes fields, summary
  end

  it "a designer sees the standard data" do
    summary = CreationSummary.new(@creation, @designer)
    fields = [:campaign, :client, :designer,
              :hours, :name, :project, :revision, :stage]
    assert_serializes fields, summary
  end

  it "a client only sees the sanitized data" do
    summary = CreationSummary.new(@creation, @client)
    fields = [:campaign, :designer,
              :name, :project, :revision, :stage]
    assert_serializes fields, summary
  end
end
