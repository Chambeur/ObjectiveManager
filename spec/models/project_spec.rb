require 'spec_helper'

describe Project do

  before(:each) do 
    @project = FactoryGirl.build(:project)
  end

  it "is valid with proper values" do
    @project.should be_valid
    @project.save.should == true
  end

  it "is invalid without a name" do
    @project.name = nil
    @project.should_not be_valid
  end

  it "is invalid without a description" do
    @project.description = nil
    @project.should_not be_valid
  end

end
