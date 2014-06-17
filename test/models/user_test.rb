require "test_helper"

class UserTest < ActiveSupport::TestCase

  def user
    @user ||= User.new
  end

  def test_valid
    assert user.valid?
  end

  def test_that_the_number_of_points_a_user_has_is_the_total_unredeemed_points
  	user = users(:one)

  	assert_equal 2, user.chase_points.length
  	assert_equal 10, user.points_available
  end

end
