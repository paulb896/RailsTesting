Given /^a user with name (.+)$/ do |name|
  @user = User.create!(:username => name)
end

Given /^user has no availabilty set$/ do
  #@user.
end

Given /^user is available from "(.*?)" to "(.*?)"$/ do |arg1, arg2|
  
end

When /^I request a user schedule$/ do
  @response = visit '/user/schedule'
  @pass_variable = "Stuff is here\n\n\n"
end

Then /^I should see "(.*?)"$/ do |text|
  #puts @pass_variable
  page.should have_content(text)
end
