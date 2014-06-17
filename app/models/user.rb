# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  employeeID    :string(255)
#  first_name    :string(255)
#  last_name     :string(255)
#  email         :string(255)
#  phone_number  :string(255)
#  role_id       :string(255)
#  backend_admin :boolean
#  created_at    :datetime
#  updated_at    :datetime
#  provider      :string(255)
#  uid           :string(255)
#  company_id    :integer
#  department    :string(255)
#

class User < ActiveRecord::Base
  belongs_to :role
  belongs_to :company
  
  devise :omniauthable
  has_many :chase_points

  def role_name
    role.name
  end

  def points_available
    if !chase_points.empty?
      return chase_points.collect { |point| point.redeemed ? 0 : point.amount }.inject{ |sum,x| sum + x }
    else
      return 0
    end
  end

  def name
  	"#{first_name} #{last_name}"
  end
end
