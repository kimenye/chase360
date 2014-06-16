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
#  branch_id       :integer
#  product_id      :integer
#

class Lead < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	validates :phone_number, presence: true
	validates :submitted_by_id, presence: true
	validates :status, presence: true
	validates :product_id, presence: true
	

	belongs_to :branch
	belongs_to :product
end
