require 'spec_helper'

describe Pools::StatusController do
  describe "GET /edit" do
    it "assigns the pool" do
      pool = double
      ::Pool.stub(:find).with("5") { pool }
      get :edit, pool_id: "5"
      expect(assigns(:pool)).to be (pool)
    end
  end

  describe "PUT /update" do
    before do
      BraggingPoints::Pools::Status.stub(:update_to)
    end

    it "redirects back to the edit status page" do
      put :update, pool_id: "5", new_status: "active"
      expect(response).to redirect_to(edit_pool_status_url("5"))
    end

    it "updates the status of the pool" do
      BraggingPoints::Pools::Status.should_receive(:update_to).with("5", "active")
      put :update, pool_id: "5", new_status: "active"
    end
  end
end
