require 'test_helper'

class ProfileTest < ActiveSupport::TestCase

  test "validate presences" do
    profile = Profile.new

    assert(profile.invalid?)
    assert(profile.errors[:pseudo].any?)
    assert(profile.errors[:user].any?)

    assert(!profile.errors[:firstname].any?)
    assert(!profile.errors[:lasttname].any?)
    assert(!profile.errors[:birthday].any?)
  end

  test "validates uniqueness" do
    profile = Profile.new(pseudo: profiles(:full).pseudo)

    assert(!profile.save)
    assert(profile.errors[:pseudo].any?)
  end

  test "percent number" do
    Profile.all.each do |profile|
      assert(profile.percent >= 0)
      assert(profile.percent <= 100)
    end
  end
end
