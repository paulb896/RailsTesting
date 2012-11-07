Given /^a user with name (.+)$/ do |user_name|
  @user = User.new
  @user.username = user_name
  @user.save
end

Given /^"(.*?)" has no availabilty set$/ do |user_name|
  user = User.find(:first, :conditions => [ "username = ?", user_name ])
  user.load_schedule
  user.get_helper.availability.clear
  user.save
end

Given /^"(.*?)" is available from "(.*?)" to "(.*?)"$/ do |user_name, start_date, end_date|
  user = User.find(:first, :conditions => [ "username = ?", user_name ])
  user.load_schedule
  user.get_helper.make_available(start_date, end_date)
  user.save
end

When /^I request "(.*?)"'s schedule$/ do |username|
  visit "/user/schedule/#{username}"
end

Then /^I should see "(.*?)"$/ do |text|
  page.should have_content(text)
end
