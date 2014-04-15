class Pool < ActiveRecord::Base
  STATUSES = ["not started", "in process", "complete"]
  validates :name, :status, :bragging_points, presence: true
  validates :bragging_points, numericality: { greater_than_or_equal_to: 0 }
  validates :status, inclusion: { in: STATUSES }

  def self.running_today
    all
  end
end
