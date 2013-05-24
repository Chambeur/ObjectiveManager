require 'test_helper'

class ObjectiveTest < ActiveSupport::TestCase
  test "validate presences" do
    obj = objectives(:full_done)
    assert(obj.valid?)
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

  test "objective status" do
    obj = objectives(:full_done)
    assert_equal(obj.status, Status::DONE)
    obj = objectives(:full_pending)
    assert_equal(obj.status, Status::PENDING)
    obj = objectives(:full_missed)
    assert_equal(obj.status, Status::MISSED)
  end

  test "objective pending number" do
    Objective.pending_nb
  end

end
