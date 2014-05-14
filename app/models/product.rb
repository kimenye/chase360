# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  image_uid   :string(255)
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Product < ActiveRecord::Base
  belongs_to :category
  
  dragonfly_accessor :image
  
  def as_json *args
    super(except: [:image_uid, :created_at, :updated_at]).merge({'image_url' => image_url})
  end
  
  def image_url
    image.try(:url)
  end
end
