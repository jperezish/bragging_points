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

        def self.all_statuses
          ["not_started", "active", "complete"]
        end

        def grouped_by_status(&block)
          self.class.all_statuses.each {|status| yield status, []}
        end

        self.all_statuses.each do |status|
          define_method status do |&block|
            in_status(status, &block)
          end
        end

        def in_status(status, &block)
          self.pools.select{ |p| p.status == status }.each(&block)
        end
      end
    end
  end
end