Given(/^there are no pools running today$/) do
end

Pool = Struct.new :status, :name
Given(/^there are some pools running today$/) do
  @pools = [
    Pool.new("not_started", "Work Survivor Pool"),
    Pool.new("not_started", "Family Survivor Pool"),
    Pool.new("active", "The Elite Survivor Pool")
  ]
end

When(/^I go to the running pools display page$/) do
  visit running_today_pools_url
end

Then(/^I should see that there are no pools running$/) do
  page.should have_content("There are no pools running today")
end

Then(/^I should see the running pools grouped by status$/) do
  @pools.each do |pool|
    within(".#{pool.status}") do
      page.should have_css(".pool", text: pool.name)
    end
  end
end