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
#  company_id  :integer
#  active      :boolean          default(TRUE)
#

require "test_helper"

class ProductTest < ActiveSupport::TestCase

  def product
    @product ||= Product.new
  end

  def test_valid
    assert product.valid?
  end

end
