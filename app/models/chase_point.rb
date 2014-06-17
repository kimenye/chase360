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

class ChasePoint < ActiveRecord::Base
  belongs_to :user
end
