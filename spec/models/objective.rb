require 'spec_helper'

describe Objective do
  it "has a valid factory" do
    Factory.create(:objective).should be_valid
  end
  it "is invalid without a title" do
    Factory.build(:objective, title: nil).should_not be_valid
  end

  it "returns an objective's status as a string"
end
