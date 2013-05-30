require 'test_helper'

class TeammemberTest < ActiveSupport::TestCase
  test "validate presences" do
    tmb = Teammember.new

    assert(tmb.invalid?)
    assert(tmb.errors[:manager].any?)
    assert(tmb.errors[:user].any?)
    assert(tmb.errors[:team].any?)
  end
end
