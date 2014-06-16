# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  message    :text
#  lead_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Note < ActiveRecord::Base
  belongs_to :lead
  belongs_to :user
end
