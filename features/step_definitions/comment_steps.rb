Then /^there should be (\d+) comments?$/ do |number|
  all(:css, '#comments li').size.should eql(number)
end

Then /^the comment form should be visible$/ do
  page.should have_selector(:css, 'form#new_comment')
end

When /^I enter a comment and submit it$/ do
  fill_in 'comment_body', with: 'Test Comment'
  click_button 'Add Comment'
end
