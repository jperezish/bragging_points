Pool = Struct.new :status, :name
require 'pools/presenters/collection'

module BraggingPoints
  module Pools
    def self.running_today
      pools = [
        Pool.new("not_started", "Work Survivor Pool"),
        Pool.new("not_started", "Family Survivor Pool"),
        Pool.new("active", "The Elite Survivor Pool")
      ]

      Presenters::Collection.for(pools)
    end
  end
end