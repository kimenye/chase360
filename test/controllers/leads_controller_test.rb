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

  def test_can_return_leads_created_by_a_specific_user
    get :index, { submitted_by_id: users(:bank).id }
    assert_response :success

    assert Lead.where(submitted_by_id: users(:bank).id).count == JSON(response.body).count
  end

  def test_a_lead_id_is_returned_if_the_lead_is_successfully_saved  	
  	post :create, { name: "Muaad", phone_number: "2123456789", email: "sdfsd@gmail.com", submitted_by_id: users(:one).id, product_id: products(:one).id, branch_id: branches(:one).id}
  	assert_response :success

  	id = JSON(response.body)['id']
  	assert_equal id, Lead.last.id

  	lead = Lead.find(id)
  	assert_equal "Muaad", lead.name
  	assert_equal "2123456789", lead.phone_number
  	assert_equal "sdfsd@gmail.com", lead.email
    assert_equal products(:one).id, lead.product_id
    assert_equal branches(:one).id, lead.branch_id
  end

  def test_that_a_lead_is_submitted_by_a_user
  	post :create, { name: "Muaad", phone_number: "2123456789", email: "sdfsd@gmail.com", submitted_by_id: users(:one).id, product_id: products(:one).id, branch_id: branches(:one).id }
  	assert_response :success
  end

  def test_that_a_leads_status_is_set_to_new_when_it_is_submitted
  	post :create, { name: "Muaad", phone_number: "2123456789", email: "sdfsd@gmail.com", submitted_by_id: users(:one).id, product_id: products(:one).id, branch_id: branches(:one).id }
  	assert_response :success

  	lead = Lead.last
  	assert_equal "New", lead.status
  end

  def test_that_a_note_is_saved_when_passed_in_during_lead_creation
    post :create, { name: "Muaad", phone_number: "2123456789", email: "sdfsd@gmail.com", submitted_by_id: users(:one).id, product_id: products(:one).id, branch_id: branches(:one).id, message: "this guy is cool" }
    assert_response :success

    note = Note.last    
    assert_equal "this guy is cool", note.message
  end

  def test_that_a_lead_can_be_closed
    status_before = leads(:new).status
    
    post :close, { id: leads(:new).id }
    assert_response :success

    id = JSON(response.body)['id']
    lead = Lead.find(id)

    assert "Closed" == lead.status, "The lead status was not updated"
  end


end
