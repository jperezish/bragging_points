require 'spec_helper'

describe Pool do
  it "requires a name" do
    pool = Pool.new(name: "")

    expect(pool.valid?).to be_false
    expect(pool.errors[:name].any?).to be_true
  end

  it "requires a status"
  it "requires bragging points"
  it "rejects negative bragging points"
  it "accepts 0 bragging points"
  it "rejects any status that's not on the status list"
  it "is valid with example attributes"
end