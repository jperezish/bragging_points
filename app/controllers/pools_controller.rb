require 'pools_wrapper'
require 'pools/status'

class PoolsController < ApplicationController
  def running_today
    @pools = BraggingPoints::Pools.running_today
  end

  def update_status
    BraggingPoints::Pools::Status.update_to(pool_id, params[:new_status])
    redirect_to edit_pool_status_url(pool_id)
  end

private

  def pool_id
    params[:id]
  end
end
