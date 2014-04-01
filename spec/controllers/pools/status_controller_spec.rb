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
end
