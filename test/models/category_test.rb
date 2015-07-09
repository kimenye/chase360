# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  def category
    @category ||= Category.new
  end

  def test_valid
    assert category.valid?
  end

end
