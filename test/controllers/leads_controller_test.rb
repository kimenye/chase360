require "test_helper"

class LeadsControllerTest < ActionController::TestCase
  
  def test_invoking_leads_returns_all_the_leads
  	get :index
  	assert_response :success
  	assert Lead.count, JSON(response.body).count  	
  end

end
