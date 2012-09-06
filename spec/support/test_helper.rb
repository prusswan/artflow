def setup_designer
  @designer = FactoryGirl.build(:designer)
  3.times do
    creation = FactoryGirl.create(:creation, hours: 2, designer: @designer)
    @designer.projects << creation.project
  end
  @designer.save
end

def assert_serializes(fields, summary)
  fields.sort.should eql(summary.data.keys.sort), "Serialization fields do not match"
end
