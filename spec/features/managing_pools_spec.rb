require 'spec_helper'

describe "Managing pools" do
  context "creating a new pool" do
    it "displays the pool in the pool details page" do
      visit root_url
      click_link "Create New Pool"

      fill_in "Name", with: "Awesome Pool!"
      fill_in "Status", with: "not started"
      fill_in "Bragging points", with: "25"
      click_button "Create Pool"

      page.should have_content("Awesome Pool!")
    end
  end

  context "with an existing pool" do

    before do
      @pool = Pool.create(pool_attributes)
      visit root_url
      click_link @pool.name
    end

    context "editing an existing pool" do
      it "displays the updated info in the pool details page" do
        click_link "Edit"
        fill_in "Name", with: "Awesome Pool!"
        click_button "Update Pool"

        page.should have_content("Awesome Pool!")
      end
    end

    context "deleting an existing pool" do
      it "removes the pool info form the pool listing page" do
        click_link "Delete"

        expect(current_url).to eq(pools_url)
        page.should_not have_content(@pool.name)
      end
    end
  end
end