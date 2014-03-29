require 'pools/presenters/collection'
require 'pools'

describe BraggingPoints::Pools do
  describe ".running_today" do
    it "returns the collection wrapped in the presenter" do
      presenter = double
      BraggingPoints::Pools::Presenters::Collection.stub(:for) { presenter }

      expect(BraggingPoints::Pools.running_today).to be(presenter)
    end
  end
end