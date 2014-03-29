require 'spec_helper'

describe PoolsController do
  describe "GET /running_today" do
    it "uses a pools collection presenter" do
      pools_presenter = double
      stub_const("BraggingPoints::Pools::Presenters::Collection", double(for: pools_presenter))

      get :running_today
      expect(assigns(:pools)).to be(pools_presenter)
    end
  end
end