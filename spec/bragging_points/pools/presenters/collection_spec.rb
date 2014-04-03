require 'pools/presenters/collection'

describe BraggingPoints::Pools::Presenters::Collection do
  context "getting the pools grouped by status" do
    let(:not_started) { double("not_started", status: "not_started") }
    let(:active) { double("active", status: "active") }
    let(:complete) { double("complete", status: "complete") }
    let(:pools) { [not_started, active, complete] }
    let(:presenter) { BraggingPoints::Pools::Presenters::Collection.for(pools) }

    it "exposes those in the not_started status" do
      expect{ |b| presenter.not_started(&b) }.to yield_successive_args(not_started)
    end

    it "exposes those in the active status" do
      expect{ |b| presenter.active(&b) }.to yield_successive_args(active)
    end

    it "exposes those in the complete status" do
      expect{ |b| presenter.complete(&b) }.to yield_successive_args(complete)
    end

    describe "#grouped_by_status" do
      it "yields the possible statuses for a pool" do
        expected_statuses = ["not_started", "active", "complete"]
        presenter = BraggingPoints::Pools::Presenters::Collection.for([])
        presenter.grouped_by_status do |status, _|
          expected_statuses.delete status
        end
        expect(expected_statuses).to eq([])
      end

      it "yields the pools associated with the statuses" do
        yielded_pools = {}
        presenter.grouped_by_status do |status, pools|
          yielded_pools[status] = pools
        end
        expect(yielded_pools["not_started"]).to eq([not_started])
        expect(yielded_pools["active"]).to eq([active])
        expect(yielded_pools["complete"]).to eq([complete])
      end
    end
  end
end