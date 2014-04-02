require 'pools_wrapper'
require 'pools/status'

module Pools
  class StatusController < ApplicationController
    def edit
      @pool = Pool.find(pool_id)
    end

    def update
    BraggingPoints::Pools::Status.update_to(pool_id, params[:new_status])
    redirect_to edit_pool_status_url(pool_id)
    end
  private

    def pool_id
      params[:pool_id]
    end
  end
end