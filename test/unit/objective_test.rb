require 'test_helper'

class ObjectiveTest < ActiveSupport::TestCase
  test "validate presences" do
    obj = objectives(:unvalid_presence)
    assert(!obj.valid?)
  end

  test "objective done" do
    obj = objectives(:full_done)
    assert(obj.done?)
  end

  test "objective pending" do
    obj = objectives(:full_pending)
    assert(!obj.done?)
    assert(obj.startdate.cweek >= Date.today.cweek && obj.startdate.cwyear >= Date.today.cwyear)
  end

  test "objective missed" do
    obj = objectives(:full_missed)
    assert(!obj.done?)
    assert(obj.startdate.cweek < Date.today.cweek || obj.startdate.cwyear < Date.today.cwyear)
  end

end
