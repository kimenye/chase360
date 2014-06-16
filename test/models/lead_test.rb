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
