require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "validates presences" do
    prj = Project.new

    assert(prj.invalid?)
    assert(prj.errors[:name].any?)
    assert(prj.errors[:description].any?)
    assert(prj.errors[:team].any?)
  end

  test "validates uniqueness" do
    prj = Project.new(name: projects(:full).name)

    assert(!prj.save)
    assert(prj.errors[:name].any?)
  end

end
