require 'test_helper'

class ObjectiveTest < ActiveSupport::TestCase
  test "validate presences" do
    obj = objectives(:full_done)
    assert(obj.valid?)
    temp = obj

    obj.done = false
    assert(obj.valid?)
    obj = temp

    obj.description = ""
    assert(obj.valid?)
    obj = temp

    obj.user = nil
    assert(!obj.valid?)
    obj = temp

    obj.title = ""
    assert(!obj.valid?)
    obj = temp

    obj.done = nil
    assert(!obj.valid?)
    obj = temp

    obj.startdate = nil
    assert(!obj.valid?)
    obj = temp

    obj.project = nil
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
    full = users(:full)
    assert_equal(Objective.pending_nb(full.id), 1)
    assert_equal(Objective.pending_nb(full.id), Objective.pending_nb(full.id, Date.today))

    user1 = users(:user_1)
    assert_equal(Objective.pending_nb(user1.id), 3)
    assert_equal(Objective.pending_nb(user1.id, Date.today), 3)
    assert_equal(Objective.pending_nb(user1.id, Date.today.prev_week), 1)

    proj = projects(:full)
    assert_equal(Objective.pending_nb(user1.id, Date.today, proj.id), 2)
  end

  test "objective undone number" do
    assert_equal(Objective.undone_nb(Date.today), 6)
    assert_equal(Objective.undone_nb(Date.today.prev_week), 4)

    user1 = users(:user_1)
    assert_equal(Objective.undone_nb(Date.today, user_id: user1.id), 3)

    proj = projects(:full)
    assert_equal(Objective.undone_nb(Date.today, project_id: proj.id), 3)

    assert_equal(Objective.undone_nb(Date.today, user_id: user1.id, project_id: proj.id), 2)
  end

  test "objective done number" do
    assert_equal(Objective.done_nb(Date.today), 5)
    assert_equal(Objective.done_nb(Date.today.prev_week), 1)

    user1 = users(:user_1)
    assert_equal(Objective.done_nb(Date.today, user_id: user1.id), 2)

    proj = projects(:full)
    assert_equal(Objective.done_nb(Date.today, project_id: proj.id), 2)

    assert_equal(Objective.done_nb(Date.today, user_id: user1.id, project_id: proj.id), 1)
  end
end
