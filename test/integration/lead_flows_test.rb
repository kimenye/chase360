require "test_helper"

class LeadFlowsTest < ActionDispatch::IntegrationTest
  def test_that_a_user_can_login_and_submit_a_lead    
    # Verify that the user is authorized to log in
    post "/verify", { email: users(:bank).email }
    
    assert_response :success
    assert JSON(response.body)['user_id'] == users(:bank).id, "Did not return the correct user id"

    # Cet the companies
    get "/companies", :format => :json
    assert_response :success
    assert Company.count == JSON(response.body).count, "Did not return all the companies" 


    # Update the user profile
    post "/users/#{users(:bank).id}", { name: "Muaad", phone_number: "254722654456", company_id: companies(:bank).id, department: "Marketing" }
    assert_response :success

    points_before = users(:bank).points_available
    assert 0 == points_before

    # Create a lead
    post "/leads", { name: "Muaad", phone_number: "2123456789", email: "sdfsd@gmail.com", submitted_by_id: users(:bank).id, product_id: products(:insurance).id, branch_id: branches(:ca_hq).id}
    assert_response :success

    lead_id = JSON(response.body)['id']
    lead = Lead.find(lead_id)

    assert lead, "Lead was created"
    assert lead.id == Lead.last.id, "Lead was not created"
    assert lead.status == "New", "Lead status is new"
    assert lead.submitted_by == users(:bank)

    # Check that the user is allocated 5 points
    get "/users/#{users(:bank).id}", :format => :json
    assert_response :success

    points_after = JSON(response.body)['points_available']
    assert (points_before + 5) == points_after, "Chase points were not awarded" 

    # Check that the lead was assigned to the correct company RO
    assert lead.assigned_to == users(:chase_assurance_ro), "The user was not assiged to the right RO"


  end
end
