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
#  verified        :boolean
#  value           :decimal(, )
#  verified_by_id  :integer
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
	belongs_to :submitted_by, class_name: "User"
	belongs_to :assigned_to, class_name: "User"
	belongs_to :verified_by,class_name:"User"
	after_create :assign_chase_points	
	after_create :assign_lead

	scope :open, where(:status => "New")	
	scope :closed, where(:status => "Closed")	
	scope :verified, where(:status => "Verified")	
	scope :all, where("")


	def company
		product.company
	end

	private
		def assign_chase_points
			if submitted_by
				ChasePoint.create! user: submitted_by, amount: 5, redeemed: false 
			end
		end

		def assign_lead
			# find the company
			company = product.company
			users = User.where(company_id: company.id, role_id: Role.find_by(name: "Relationship Officer").id)			
			if !users.empty?
				self.assigned_to_id = users.sample.id
				save!
			end
		end
end
