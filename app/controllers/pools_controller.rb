Pool = Struct.new :status, :name

class PoolsController < ApplicationController
  def running_today
    @pools = Object.new
    def @pools.active(&block)
      [
        Pool.new("active", "The Elite Survivor Pool")
      ].each(&block)
    end
    def @pools.not_started(&block)
      [
        Pool.new("not_started", "Work Survivor Pool"),
        Pool.new("not_started", "Family Survivor Pool")
      ].each(&block)
    end
  end
end
