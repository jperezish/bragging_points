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

  describe "PUT /update_status" do
    before do
      BraggingPoints::Pools::Status.stub(:update_to)
    end

    it "redirects back to the edit status page" do
      put :update_status, id: "5", new_status: "active"
      expect(response).to redirect_to(edit_pool_status_url("5"))
    end

    it "updates the status of the pool" do
      BraggingPoints::Pools::Status.should_receive(:update_to).with("5", "active")
      put :update_status, id: "5", new_status: "active"
    end
  end
end