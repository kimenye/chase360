# == Schema Information
#
# Table name: leads
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  phone_number    :string(255)
#  submitted_by_id :integer
#  status          :string(255)
#  assigned_to_id  :integer
#  created_at      :datetime
#  updated_at      :datetime
#  branch_id       :integer
#  product_id      :integer
#  verified        :boolean
#  value           :decimal(, )
#  verified_by_id  :integer
#  note            :text
#

require "test_helper"

class LeadTest < ActiveSupport::TestCase

  def lead
    @lead ||= Lead.new
  end

  def test_valid
    assert_equal false, lead.valid?

	lead.name = "Test"    
	lead.email = "me@gmail.com"    
	lead.phone_number = "254676987988"    
	lead.submitted_by_id = users(:one).id
	lead.status="New"
	lead.product_id=products(:one).id
	

	assert lead.valid?
  end

end
