require "pools"

class PoolsController < ApplicationController
  def running_today
    @pools = BraggingPoints::Pools.running_today
  end

  def edit_status
    @pool = Pool.find(params[:id])
  end

  def update_status
  end
end
