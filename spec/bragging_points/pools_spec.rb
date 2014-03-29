require 'pools/presenters/collection'
require 'pools'

describe BraggingPoints::Pools do
  describe ".running_today" do
    it "wraps the pools running today in a presenter" do
      running_today = double "pools"
      stub_const("::Pool", double(running_today: running_today))
      presenter = double
      BraggingPoints::Pools::Presenters::Collection.stub(:for).with(running_today) { presenter }

      expect(BraggingPoints::Pools.running_today).to be(presenter)
    end
  end
end