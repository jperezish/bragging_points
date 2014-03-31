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
  end
end