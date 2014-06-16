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

  def test_a_lead_id_is_returned_if_the_lead_is_successfully_saved  	
  	post :create, { name: "Muaad", phone_number: "2123456789", email: "sdfsd@gmail.com", submitted_by_id: users(:one).id }
  	assert_response :success

  	id = JSON(response.body)['id']
  	assert id, Lead.last.id

  	lead = Lead.find(id)
  	assert "Muaad", lead.name
  	assert "2123456789", lead.phone_number
  	assert "sdfsd@gmail.com", lead.email
  end

  def test_that_a_lead_is_submitted_by_a_user
  	post :create, { name: "Muaad", phone_number: "2123456789", email: "sdfsd@gmail.com", submitted_by_id: users(:one).id }
  	assert_response :success
  end

end
