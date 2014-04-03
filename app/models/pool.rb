require 'pools/statuses'

class Pool < ActiveRecord::Base
  def self.running_today
    all
  end

  def update_status(new_status)
    self.update_attributes status: new_status
  end

  def available_next_statuses
    BraggingPoints::Pools::Statuses.all - [self.status]
  end
end
