require 'spec_helper'

describe Team do

  before(:each) do 
    @team = FactoryGirl.build(:team)
  end

  it "is valid with proper values" do
    @team.should be_valid
    @team.save.should == true
  end

  it "is invalid without a name" do
    @team.name = nil
    @team.should_not be_valid
  end

  it "is invalid without a boolean for autogenerate" do
    @team.autogenerate = true
    @team.should be_valid

    @team.autogenerate = false
    @team.should be_valid

    @team.autogenerate = nil
    @team.should_not be_valid
  end

end
