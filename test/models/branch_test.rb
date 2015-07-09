# == Schema Information
#
# Table name: branches
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#

require "test_helper"

class BranchTest < ActiveSupport::TestCase

  def branch
    @branch ||= Branch.new
  end

  def test_valid
    assert branch.valid?
  end

end
