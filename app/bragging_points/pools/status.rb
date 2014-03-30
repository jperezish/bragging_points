module BraggingPoints
  module Pools
    class Status
      def self.update_to(pool_id, new_status)
        ::Pool.find(pool_id).update_status new_status
      end
    end
  end
end