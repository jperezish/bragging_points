class Pool < ActiveRecord::Base
  def self.running_today
    all
  end
end
