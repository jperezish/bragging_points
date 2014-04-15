require 'spec_helper'

describe Pool do
  it "requires a name" do
    pool = Pool.new(name: "")

    expect(pool.valid?).to be_false
    expect(pool.errors[:name].any?).to be_true
  end

  it "requires a status" do
    pool = Pool.new(status: "")

    expect(pool.valid?).to be_false
    expect(pool.errors[:status].any?).to be_true
  end

  it "requires bragging points" do
    pool = Pool.new(bragging_points: "")

    expect(pool.valid?).to be_false
    expect(pool.errors[:bragging_points].any?).to be_true
  end

  it "rejects negative bragging points" do
    pool = Pool.new(bragging_points: -21)

    expect(pool.valid?).to be_false
    expect(pool.errors[:bragging_points].any?).to be_true
  end

  it "accepts 0 bragging points" do
    pool = Pool.new(bragging_points: 0)

    expect(pool.valid?).to be_false
    expect(pool.errors[:bragging_points].any?).to be_false
  end

  it "rejects any status that's not on the status list" do
    statuses = ["not started", "in process", "complete"]

    statuses.each do |status|
      pool = Pool.new(status: status)

      expect(pool.valid?).to be_false
      expect(pool.errors[:status].any?).to be_false
    end
  end
  it "is valid with example attributes" do
    pool = Pool.new(pool_attributes)

    expect(pool.valid?).to be_true
  end
end