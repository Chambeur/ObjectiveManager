require 'spec_helper'

describe Label do

  before(:each) do 
    @lalel = FactoryGirl.build(:label)
  end

  it "is valid with proper values" do
    @lalel.should be_valid
    @lalel.save.should == true
  end

  it "is invalid without a name" do
    @lalel.name = nil
    @lalel.should_not be_valid
  end

  it "is invalid without a colour" do
    @lalel.colour = nil
    @lalel.should_not be_valid
  end

end
