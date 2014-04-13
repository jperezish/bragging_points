class Pool < ActiveRecord::Base
  validates :name, presence: true

  def self.running_today
    all
  end
end
