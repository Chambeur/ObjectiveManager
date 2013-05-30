require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  test "validate presences" do
    team = Team.new

    assert(team.invalid?)
    assert(team.errors[:name].any?)
    assert(team.errors[:autogenerate].any?)
  end
end
