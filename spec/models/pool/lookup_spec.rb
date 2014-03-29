require 'active_record_spec_helper'
require 'pool'

describe "Looking up pools" do
  describe ".running_today" do
    context "when there are no pools" do
      it "returns an empty list" do
        Pool.destroy_all
        expect(Pool.running_today).to be_empty
      end
    end
  end
end