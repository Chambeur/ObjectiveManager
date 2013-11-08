require 'spec_helper'

describe Profile do
  
  before(:each) do 
    @profile = FactoryGirl.build(:profile)
  end

  it "is valid with proper values" do
    @profile.should be_valid
    @profile.save.should == true
  end

  it "is invalid without a pseudo" do
    @profile.pseudo = nil
    @profile.should_not be_valid
  end

  it "is valid without a firstname" do
    @profile.firstname = nil
    @profile.should be_valid
  end

  it "is valid without a lastname" do
    @profile.lastname = nil
    @profile.should be_valid
  end
  
end