require 'spec_helper'

describe "Viewing pools" do
  before do
      @pools = [
        Pool.create!(pool_attributes),
        Pool.create!(pool_attributes(name: "Cool Pool")),
        Pool.create!(pool_attributes(name: "Stay in School Pool"))
      ]
  end

  context "when viewing the pool listings" do
    it "provides a message when no pools are running" do
      Pool.destroy_all
      visit pools_url

      page.should have_content("There are no pools running today")
    end

    it "displays a listing of active pools" do
      visit pools_url

      @pools.each do |pool|
        page.should have_css(".pool", text: pool.name)
      end
    end
  end

  context "when viewing the details of a pool" do
    it "displays the details of a pool" do
      visit pools_url
      pool = Pool.find_by(name: "Cool Pool")
      click_link pool.name

      page.should have_css(".pool-name", text: pool.name)
    end
    it "displays no bragging points when the pool has 0 bragging points" do
      pool = Pool.create(pool_attributes(name: "Free Pool", bragging_points: 0))
      visit pools_url
      click_link pool.name
      page.should have_css(".bragging_points", text: "No")
    end
  end
end