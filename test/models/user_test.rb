# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  employeeID    :string(255)
#  email         :string(255)
#  phone_number  :string(255)
#  role_id       :string(255)
#  backend_admin :boolean
#  created_at    :datetime
#  updated_at    :datetime
#  provider      :string(255)
#  uid           :string(255)
#  company_id    :integer
#  setup         :boolean
#  name          :string(255)
#  image_uid     :string(255)
#  department_id :integer
#  branch_id     :integer
#

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
