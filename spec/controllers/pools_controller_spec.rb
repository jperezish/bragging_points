require 'spec_helper'

describe PoolsController do
  describe "GET /running_today" do
    it "uses a pools collection presenter" do
      pools_presenter = double
      BraggingPoints::Pools::Presenters::Collection.stub(:for) { pools_presenter }

      get :running_today
      expect(assigns(:pools)).to be(pools_presenter)
    end
  end
end