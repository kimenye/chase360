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
#  note            :text
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

	scope :open, -> { where(status: 'New') }
	scope :closed, -> { where(status: 'Closed') }
	scope :verified, -> { where(status: 'Verified') }
	# scope :all, -> { order("created_at DESC") }
	# default_scope all


	def company
		product.company
	end

	def day_created
		created_at.to_date
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
				user = users.sample
				self.assigned_to_id = user.id
				save!				
				LeadMailer.assigned_notification(user,self).deliver_now
				if Rails.env.production?
					Push.send user.email, "You have been assigned a lead",
						{
						    reason: "Lead Assinged",
						    notification_type: "LeadAssigned",
						    user_id: self.assigned_to_id,
						    lead_id: self.id,
						    company_id: self.product.company.id,
						    product_id: self.product.id,
						    lead_name: self.name,
						    lead_email: self.email,
						    lead_phone_number: self.phone_number,
						    created_by_user_id: self.submitted_by_id,
						    created_by_user_name: self.submitted_by.name
						}
				end				
			end
		end
end
