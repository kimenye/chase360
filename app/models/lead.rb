# == Schema Information
#
# Table name: leads
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  phone_number    :string(255)
#  submitted_by_id :integer
#  status          :string(255)
#  assigned_to_id  :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Lead < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	validates :phone_number, presence: true
end
