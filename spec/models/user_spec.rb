require 'spec_helper'

describe User do
	
  before(:each) do
    @user = FactoryGirl.build(:user)
  end

  it "is valid with proper values" do
    @user.should be_valid
    @user.save.should == true
  end

  it "is invalid without an email" do
    @user.email = nil
    @user.should_not be_valid
  end

  it "is invalid without a password" do
    @user.password = nil
    @user.should_not be_valid
  end

end