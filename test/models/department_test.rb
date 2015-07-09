# == Schema Information
#
# Table name: departments
#
#  id         :integer          not null, primary key
#  company_id :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require "test_helper"

class DepartmentTest < ActiveSupport::TestCase

  def department
    @department ||= Department.new
  end

  def test_valid
    assert department.valid?
  end

end
