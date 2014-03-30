require 'pools/status'

describe BraggingPoints::Pools::Status do
  describe ".update_to" do
    it "tells the pool to update its status" do
      pool = double
      stub_const("::Pool", double(find: pool))
      pool.should_receive(:update_status).with("active")

      BraggingPoints::Pools::Status.update_to("5", "active")
    end
  end
end