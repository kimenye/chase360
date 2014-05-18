# == Schema Information
#
# Table name: companies
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  image_uid   :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Company < ActiveRecord::Base
  has_many :categories
  
  dragonfly_accessor :image
  
  attr_accessor :image_url
  
  def as_json *args
    super(except: [:image_uid, :created_at, :updated_at]).merge({'image_url' => image_url})
  end
  
  def image_url
    "#{ENV["host"]}#{image.try(:url)}"
  end
end
