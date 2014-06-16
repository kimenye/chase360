# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  employeeID   :string(255)
#  first_name   :string(255)
#  last_name    :string(255)
#  email        :string(255)
#  phone_number :string(255)
#  role_id      :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class User < ActiveRecord::Base
  belongs_to :role
  devise :omniauthable

  def role_name
    role.name
  end
end
