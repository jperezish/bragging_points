require 'pools/presenters/collection'
Pool = Struct.new :status, :name

class PoolsController < ApplicationController
  def running_today
    pools = [
        Pool.new("not_started", "Work Survivor Pool"),
        Pool.new("not_started", "Family Survivor Pool"),
        Pool.new("active", "The Elite Survivor Pool")
      ]
    @pools = BraggingPoints::Pools.running_today
  end
end
