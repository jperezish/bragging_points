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
  page.should have_css(".pool", text: @pool.name)
end