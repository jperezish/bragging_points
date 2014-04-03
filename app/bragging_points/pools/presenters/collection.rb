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

        def filtered_by_status(status)
          self.pools.select{ |p| p.status == status }
        end

        def grouped_by_status(&block)
          self.class.all_statuses.each do |status|
            yield status, filtered_by_status(status)
          end
        end

        self.all_statuses.each do |status|
          define_method status do |&block|
            in_status(status, &block)
          end
        end

        def in_status(status, &block)
          filtered_by_status(status).each(&block)
        end
      end
    end
  end
end