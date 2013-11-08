require 'spec_helper'

describe Objective do

  before(:each) do 
    @objective = FactoryGirl.build(:objective)
  end

  it "is valid with proper values" do
    @objective.should be_valid
    @objective.save.should == true
  end

  it "is invalid without a title" do
    @objective.title = nil
    @objective.should_not be_valid
  end

  it "is invalid without a startdate" do
    @objective.startdate = nil
    @objective.should_not be_valid
  end

  it "is invalid without a boolean for done" do
    @objective.done = true
    @objective.should be_valid

    @objective.done = false
    @objective.should be_valid

    @objective.done = nil
    @objective.should_not be_valid
  end

  it "is invalid without a boolean for duplicate" do    
    @objective.duplicate = true
    @objective.should be_valid

    @objective.duplicate = false
    @objective.should be_valid

    @objective.duplicate = nil
    @objective.should_not be_valid
  end

  it "is valid without a description" do
    @objective.description = nil
    @objective.should be_valid
  end

  describe ".status" do
    
  end


end
