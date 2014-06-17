require "test_helper"

class ChasePointTest < ActiveSupport::TestCase

  def chase_point
    @chase_point ||= ChasePoint.new
  end

  def test_valid
    assert chase_point.valid?
  end

end
