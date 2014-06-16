require "test_helper"

class LeadsControllerTest < ActionController::TestCase
  
  def test_invoking_leads_returns_all_the_leads
  	get :index
  	assert_response :success
  	assert Lead.count, JSON(response.body).count  	
  end

  def test_lead_data_is_validated_before_a_lead_is_saved
  	post :create, { name: "Muaad" }
  	assert_response :unprocessable_entity
  end

end
