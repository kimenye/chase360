# == Schema Information
#
# Table name: chase_points
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  action     :string(255)
#  amount     :integer
#  redeemed   :boolean
#  created_at :datetime
#  updated_at :datetime
#

require "test_helper"

class ChasePointTest < ActiveSupport::TestCase

  def chase_point
    @chase_point ||= ChasePoint.new
  end

  def test_valid
    assert chase_point.valid?
  end

end
