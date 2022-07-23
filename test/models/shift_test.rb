require "test_helper"

class ShiftTest < ActiveSupport::TestCase

  test "should not save a shift without a start datetime" do
    shift = Shift.new
    shift.start = "24 Monday 2022, 10:00am"
    assert_not shift.save, "Saved shift without a start datetime"
  end

  test "should not save a shift without a finish datetime" do
    shift = Shift.new
    shift.finish = "24 Monday 2022, 17:00pm"
    assert_not shift.save, "Saved shift without a finish datetime"
  end

end
