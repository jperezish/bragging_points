require 'active_record_spec_helper'
require 'pool'

describe "Looking up pools" do
  describe ".running_today" do
    context "when there are no pools" do
      it "returns an empty list" do
        Pool.destroy_all
        expect(Pool.running_today).to be_empty
      end

      it "returns all of the pools in the system" do
        active = Pool.create! name: "Awesome Friends Pool", status: "active", bragging_points: 5, status: "not started"
        not_started = Pool.create! name: "Destroy All Coworkers", status: "not_started", bragging_points: 5, status: "not started"
        expect(Pool.running_today).to eq([active, not_started])
      end
    end
  end
end