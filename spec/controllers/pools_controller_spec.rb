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
end