require "pools"

class PoolsController < ApplicationController
  def running_today
    @pools = BraggingPoints::Pools.running_today
  end
end
