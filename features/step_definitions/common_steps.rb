Given /^I am designer "(.*?)" with an account$/ do |name|
  email = "#{name.downcase.gsub(' ', '.')}@artflowme.com"
  @user = Designer.create!(name: name, email: email, password: 'testtest')
end

Given /^I sign in$/ do
  visit new_designer_session_path
  fill_in 'Email', :with => @user.email
  fill_in 'Password', :with => 'testtest'
  click_button 'Sign in'
end

Then /^I should be signed in as "(.*?)"$/ do |name|
  page.should have_content("You are logged in as #{name}")
end

Transform /^(-?\d+)$/ do |number|
  number.to_i
end
