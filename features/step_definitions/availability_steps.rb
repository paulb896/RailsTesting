Given /^a user with name (.+)$/ do |name|
  User.create!(:username => name)
end

When /^I request a user schedule$/ do
  visit '/user/schedule'
end

Then /^I should see "(.*?)"$/ do |text|
  puts response.stuff
end
