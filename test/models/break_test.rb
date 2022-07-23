require "test_helper"

class BreakTest < ActiveSupport::TestCase
  test "should not save a break without a break length" do
    brk = Break.new
    assert_not brk.save, "Saved break without a break length"
  end
end
