module Pools
  class StatusController < ApplicationController
    def edit
      @pool = Pool.find(pool_id)
    end
  private

    def pool_id
      params[:pool_id]
    end
  end
end