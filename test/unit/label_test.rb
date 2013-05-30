require 'test_helper'

class LabelTest < ActiveSupport::TestCase
  test "validates presence" do
    label = Label.new

    assert(label.invalid?)
    assert(label.errors[:name].any?)
    assert(label.errors[:colour].any?)
  end
end
