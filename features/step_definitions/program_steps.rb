Given /^I have programs titled (.+)$/ do |titles|
  titles.split(', ').each do |title|
    Program.create!(:title => title, :description => 'A really long text')
  end
end

Given /^I have no programs$/ do
  Program.delete_all
end

Then /^I should have ([0-9]+) programs?$/ do |count|
  Program.count.should == count.to_i
end

Given /^the following (.+) records?$/ do |factory, table|
  table.hashes.each do |hash|
    FactoryGirl.create(factory, hash)
  end
end

Given /^I am an anonymous user$/ do
end

Given /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |username, password|
  user = User.find_by_email(username)
  user.activate!
  visit root_path
  fill_in "Email", :with => username
  fill_in "Password", :with => password
  click_button "Log in"
end

When /^I visit profile for "([^\"]*)"$/ do |email|
  user = User.find_by_email!(email)
  visit user_url(user)
end

When /^I visit list of (.+)/ do |path|
  visit url_for(eval(path + '_path'))
end

When /^I visit the new "(.*?)" page/ do | entity|
  visit url_for(eval('new_'+ entity.to_s.downcase + '_path'))
end

When /^I visit the page for (.+) "(.*?)"/ do |entity, name|
  instance = eval(entity.to_s.titlecase + '.find_by_title(name)')
  visit url_for(eval(entity.to_s.downcase + '_path(instance.id)'))
end

When /^I visit the edit page of "(.*?)" (.+)/ do |name, entity|
  instance = eval(entity.to_s.titlecase + '.find_by_title(name)')
  visit url_for(eval('edit_'+ entity.to_s.downcase + '_path(instance.id)'))
end

When /^I fill in the (.+) with "(.*?)"/ do |element, value|
  fill_in element, :with => value
end

When /^I fill in an element with id (.+) with "(.*?)"/ do |element, value|
  find('#' + element).set(value)
end

When /^I click the "(.*?)" button$/ do |button|
  click_button button
end

When /^I click the "(.*?)" link/ do |link|
  click_link link
end

When /^I select "(.*?)" from "(.*?)"/ do |value, element|
  select value, :from => element
end

Then /^I should see "(.*?)"$/ do |name|
  page.should have_content(name)
end

Then /^I should not see "(.*?)"$/ do |name|
  page.should_not have_content(name)
end
