Given /^a user with name (.+)$/ do |name|
  @user = User.new
  @user.username = name
  @user.save
end

Given /^user has no availabilty set$/ do
  #@user.
end

Given /^user is available from "(.*?)" to "(.*?)"$/ do |start_date, end_date|
  @user.load_schedule
  @user.schedule_helper.make_available(start_date, end_date)
  @user.save
end

When /^I request "(.*?)"'s schedule$/ do |username|
  visit "/user/schedule/#{username}"
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end
