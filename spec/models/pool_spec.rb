require 'spec_helper'

describe Pool do
  it "requires a name" do
    pool = Pool.new(name: "")

    expect(pool.valid?).to be_false
    expect(pool.errors[:name].any?).to be_true
  end
end