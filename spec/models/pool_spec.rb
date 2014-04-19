require 'spec_helper'

describe Pool do
  it "requires a name" do
    pool = Pool.new(name: "")

    expect(pool).to have(1).errors_on(:name)
  end

  it "requires a status" do
    pool = Pool.new(status: "")

    expect(pool).to have(2).errors_on(:status)
  end

  it "requires bragging points" do
    pool = Pool.new(bragging_points: "")

    expect(pool).to have(2).errors_on(:bragging_points)
  end

  it "rejects negative bragging points" do
    pool = Pool.new(bragging_points: -21)

    expect(pool).to have(1).errors_on(:bragging_points)
  end

  it "accepts 0 bragging points" do
    pool = Pool.new(bragging_points: 0)

    expect(pool).to have(0).errors_on(:bragging_points)
  end

  it "is valid with any status on the status list" do
    statuses = ["not started", "in process", "complete"]

    statuses.each do |status|
      pool = Pool.new(status: status)

      expect(pool).to have(0).errors_on(:status)
    end
  end

  it "rejects any status that's not on the status list" do
    statuses = ["notstarted", "inpocess", "omplete"]

    statuses.each do |status|
      pool = Pool.new(status: status)

      expect(pool).to have(1).errors_on(:status)
    end
  end
  it "is valid with example attributes" do
    pool = Pool.new(pool_attributes)

    expect(pool.valid?).to be_true
  end
end