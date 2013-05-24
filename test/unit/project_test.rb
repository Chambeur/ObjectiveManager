require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "validate presences" do
    prj = projects(:full)
    assert(prj.valid?)
    temp = prj

    prj.name = ""
    assert(!prj.valid?)
    prj = temp

    prj.description = ""
    assert(!prj.valid?)
    prj = temp

    prj.team = nil
    assert(!prj.valid?)
  end
end
