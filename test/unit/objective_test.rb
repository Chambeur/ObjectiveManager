require 'test_helper'

class ObjectiveTest < ActiveSupport::TestCase
  test "validate presences" do
    obj = Objective.new

    assert(obj.invalid?)
    assert(obj.errors[:user].any?)
    assert(obj.errors[:title].any?)
    assert(obj.errors[:startdate].any?)
    assert(obj.errors[:project].any?)
    assert(obj.errors[:done].any?)

    assert(!obj.errors[:description].any?)
  end

  test "objective status" do
    obj = objectives(:full_done)
    assert_equal(obj.status, Status::DONE)
    obj = objectives(:full_pending)
    assert_equal(obj.status, Status::PENDING)
    obj = objectives(:full_delayed_week)
    assert_equal(obj.status, Status::DELAYED)
    obj = objectives(:full_delayed_year)
    assert_equal(obj.status, Status::DELAYED)
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
