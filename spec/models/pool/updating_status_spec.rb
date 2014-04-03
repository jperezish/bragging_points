require 'active_record_spec_helper'
require 'pool'

describe "Updating the status" do
  it "updates the status" do
    pool = Pool.create! status: "not_started", name: "New Cool Pool"

    pool.update_status "active"
    pool.reload
    expect(pool.status).to eq("active")
  end

  describe "#available_next_statuses" do
    it "does not include the current status" do
      pool = Pool.new status: "complete"
      expect(pool.available_next_statuses).to_not include("complete")
    end

    it "includes the other statuses" do
      pool = Pool.new status: "complete"
      expect(pool.available_next_statuses).to include("not_started", "active")
    end
  end
end