require "test_helper"

class RoleTest < ActiveSupport::TestCase

  def role
    @role ||= Role.new
  end

  def role_name
    assert role.valid?
  end

end
