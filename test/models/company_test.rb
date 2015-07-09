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

require "test_helper"

class CompanyTest < ActiveSupport::TestCase

  def company
    @company ||= Company.new
  end

  def test_valid
    assert company.valid?
  end

end
