module BraggingPoints
  module Pools
    module Presenters
      class Collection
        def self.for(pools)
          new(pools)
        end
        attr_reader :pools
        def initialize(pools)
          @pools = pools
        end
        def not_started(&block)
          self.pools.select{ |p| p.status == "not_started" }.each(&block)
        end
        def active(&block)
          self.pools.select{ |p| p.status == "active" }.each(&block)
        end
      end
    end
  end
end