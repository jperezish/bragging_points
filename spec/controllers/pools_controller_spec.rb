require 'spec_helper'

describe PoolsController do
  describe "GET /running_today" do
    it "gets the pools running today" do
      pools_presenter = double
      BraggingPoints::Pools.stub(:running_today) { pools_presenter }

      get :running_today
      expect(assigns(:pools)).to be(pools_presenter)
    end
  end

  describe "GET /edit_status" do
    it "assigns the pool" do
      pool = double
      ::Pool.stub(:find).with("5") { pool }
      get :edit_status, id: "5"
      expect(assigns(:pool)).to be (pool)
    end
  end

  describe "PUT /update_status" do
    let(:status_updater) { double(update_to: nil) }
    before do
      stub_const("BraggingPoints::Pools::Status", status_updater)
    end

    it "redirects back to the edit status page" do
      put :update_status, id: "5", new_status: "active"
      expect(response).to redirect_to(edit_status_pool_url("5"))
    end

    it "updates the status of the pool" do
      status_updater.should_receive(:update_to).with("5", "active")
      put :update_status, id: "5", new_status: "active"
    end
  end
end