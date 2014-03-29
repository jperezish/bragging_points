require 'pools/presenters/collection'

module BraggingPoints
  module Pools
    def self.running_today
      Presenters::Collection.for(::Pool.running_today)
    end
  end
end