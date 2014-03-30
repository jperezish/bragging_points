require 'active_record_spec_helper'
require 'pool'

describe "Updating the status" do
  it "updates the status" do
    pool = Pool.create! status: "not_started", name: "New Cool Pool"

    pool.update_status "active"
    pool.reload
    expect(pool.status).to eq("active")
  end
end