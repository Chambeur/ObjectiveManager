require 'spec_helper'

describe Teammember do

  before(:each) do 
    @teammember = FactoryGirl.build(:teammember)
  end

  it "is valid with proper values" do
    @teammember.should be_valid
    @teammember.save.should == true
  end

  it "is invalid without a boolean for manager" do
    @teammember.manager = true
    @teammember.should be_valid

    @teammember.manager = false
    @teammember.should be_valid

    @teammember.manager = nil
    @teammember.should_not be_valid
  end

end
