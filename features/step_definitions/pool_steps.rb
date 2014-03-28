Given(/^there are no pools running today$/) do
end

When(/^I go to the running pools display page$/) do
  visit running_today_pools_url
end

Then(/^I should see that there are no pools running$/) do
  page.should have_content("There are no pools running today")
end

Given(/^there are some pools running today$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see the running pools grouped by status$/) do
  pending # express the regexp above with the code you wish you had
end