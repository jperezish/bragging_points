Given(/^there are no pools running today$/) do
  Pool.destroy_all
end

Given(/^there are some pools$/) do
  @pools = [
    Pool.create!(status: "not_started", name: "Work Survivor Pool"),
    Pool.create!(status: "not_started", name: "Family Survivor Pool"),
    Pool.create!(status: "active", name: "The Elite Survivor Pool")
  ]
end

Given(/^a pool that has not started$/) do
  @pool = Pool.create! status: "not_started", name: "Awesome Friends Survivor Pool"
end

Given(/^a pool that is active$/) do
  @pool = Pool.create! status: "active", name: "Crazy Badger Pool"
end

When(/^I go to the pools listing page$/) do
  visit pools_url
end

Then(/^I should see that there are no pools running$/) do
  page.should have_content("There are no pools running today")
end

Then(/^I should see some pools$/) do
  @pools.each do |pool|
    page.should have_css(".pool", text: pool.name)
  end
end

When(/^I select one of the pools$/) do
  @pool = @pools.first
  click_link @pool.name
end

Then(/^I should see the pools detail page$/) do
  page.should have_css(".pool-name", text: @pool.name)
end

When(/^I choose to create a new pool$/) do
  visit root_url
  click_link "Create New Pool"
end

When(/^I enter the required information$/) do
  fill_in "Name", with: "Awesome Pool!"
  fill_in "Status", with: "not started"
  fill_in "Bragging Points", with: "25"
  click_button "Create Pool"
end

Then(/^I should see the pool on the pool detail page$/) do
  page.should have_content("Awesome Pool!")
end

When(/^I view the details of an existing pool$/) do
  @pool = Pool.create! status: "not started", name: "Crazy Badger Pool"
  visit root_url
  click_link "Crazy Badger Pool"
end

When(/^I choose to edit an existing pool$/) do
  click_link "Edit"
end

When(/^I enter some updated information$/) do
  fill_in "Name", with: "Awesome Pool!"
  click_button "Update Pool"
end

When(/^I choose to delete an existing pool$/) do
  click_link "Delete"
end

Then(/^I should not see the pool on pool index page$/) do
  page.should_not have_content("Crazy Badger Pool")
end