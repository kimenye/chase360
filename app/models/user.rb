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

class User < ActiveRecord::Base
  belongs_to :role
  belongs_to :company
  belongs_to :department
  belongs_to :branch
  devise :omniauthable
  has_many :chase_points

  dragonfly_accessor :image
  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  def role_name
    role.try(:name)
  end

  def self.valid_domains
    [ 'lighthouse-property.com', 'genghis-capital.com', 'orchid-capital.com', 'chase-assurance.com', ' rafiki-assurance.com', 'tulip-healthcare.com', 'chasebank.co.ke', 'rafiki.co.ke', 'gencapunittrust.com', 'angua.co.ke', 'sprout.co.ke']
  end

  def self.is_allowed? email
    found = false
    self.valid_domains.each do |domain|
      if email.end_with?(domain)
        found = true
        break
      end
    end
    found
  end

  def points_available
    if !chase_points.empty?
      return chase_points.collect { |point| point.redeemed ? 0 : point.amount }.inject{ |sum,x| sum + x }
    else
      return 0
    end
  end

  def image_url
    "#{ENV["host"]}#{image.try(:url)}"
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(name: data["name"],
        email: data["email"]
        # password: Devise.friendly_token[0,20]
      )
    end
    user
  end

  # def name
  # 	"#{first_name} #{last_name}"
  # end

end
