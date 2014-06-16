require "test_helper"

class BranchTest < ActiveSupport::TestCase

  def branch
    @branch ||= Branch.new
  end

  def test_valid
    assert branch.valid?
  end

end
