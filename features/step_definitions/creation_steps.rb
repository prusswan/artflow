Given /^a creation$/ do
  # Create client record
  client = Client.create!(name: 'TestClient',
                          email: 'client@test.artflowme.com',
                          password: 'testtest',
                          password_confirmation: 'testtest')
  campaign = client.campaigns.create!(name: 'National 1')
  project = campaign.projects.create!(name: 'Pamphlet')

  # Add current user to project
  project.designers << @user

  # Add creation
  sample = File.open('spec/fixtures/creation.png')
  @creation = project.creations.create!(name: "Logo",
                                        designer: @user,
                                        description: "Test",
                                        file: sample)
end

When /^I go to the creation's page$/ do
  visit creation_path(@creation)
end
