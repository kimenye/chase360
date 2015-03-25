require "test_helper"

class LeadFlowsTest < ActionDispatch::IntegrationTest
  def test_that_a_user_can_login_and_submit_a_lead 
    Lead.delete_all
    stub_request(:post, "https://mativo:MAPP2014@pushapi.infobip.com/3/application/0a7535fbb603/message").
            with(:body => "{\"sentType\":\"userIDs\",\"mimeType\":\"text/plain\",\"OSTypes\":[\"Android\"],\"notificationMessage\":\"You have been awarded 30 Miles.\",\"androidData\":{\"title\":\"You have been awarded 30 Miles.\"},\"additionalInfo\":{\"reason\":\"Installing 360 Me\",\"user_id\":408993661,\"miles\":30,\"total_miles\":30,\"notification_type\":\"MilesAwarded\"},\"userIDs\":[\"test@chasebank.co.ke\"]}",
                 :headers => {'Content-Type'=>'application/json'}).
            to_return(:status => 200, :body => "", :headers => {})

    stub_request(:post, "https://mativo:MAPP2014@pushapi.infobip.com/3/application/0a7535fbb603/message").
            with(:body => "{\"sentType\":\"userIDs\",\"mimeType\":\"text/plain\",\"OSTypes\":[\"Android\"],\"notificationMessage\":\"You have been assigned a lead\",\"androidData\":{\"title\":\"You have been assigned a lead\"},\"additionalInfo\":{\"reason\":\"Lead Assinged\",\"notification_type\":\"LeadAssigned\",\"user_id\":207107842,\"lead_id\":980190963,\"company_id\":207107842,\"product_id\":604942157,\"lead_name\":\"Muaad\",\"lead_email\":\"sdfsd@gmail.com\",\"lead_phone_number\":\"2123456789\",\"created_by_user_id\":408993661,\"created_by_user_name\":\"Muaad\"},\"userIDs\":[\"sales@chaseassurance.com\"]}",
                 :headers => {'Content-Type'=>'application/json'}).
            to_return(:status => 200, :body => "", :headers => {})

    stub_request(:post, "https://mativo:MAPP2014@pushapi.infobip.com/3/application/0a7535fbb603/message").
            with(:body => "{\"sentType\":\"userIDs\",\"mimeType\":\"text/plain\",\"OSTypes\":[\"Android\"],\"notificationMessage\":\"You have been assigned a lead\",\"androidData\":{\"title\":\"You have been assigned a lead\"},\"additionalInfo\":{\"reason\":\"Lead Assinged\",\"notification_type\":\"LeadAssigned\",\"user_id\":781613748,\"lead_id\":980190963,\"company_id\":207107842,\"product_id\":604942157,\"lead_name\":\"Muaad\",\"lead_email\":\"sdfsd@gmail.com\",\"lead_phone_number\":\"2123456789\",\"created_by_user_id\":408993661,\"created_by_user_name\":\"Muaad\"},\"userIDs\":[\"sales@chaseassurance.com\"]}",
                 :headers => {'Content-Type'=>'application/json'}).
            to_return(:status => 200, :body => "", :headers => {})

    # Verify that the user is authorized to log in
    post "/verify", { email: users(:bank).email }
    
    assert_response :success
    assert JSON(response.body)['user_id'] == users(:bank).id, "Did not return the correct user id"

    # Cet the companies
    get "/companies", :format => :json
    assert_response :success
    assert Company.count == JSON(response.body).count, "Did not return all the companies" 


    # Update the user profile
    post "/users/#{users(:bank).id}", { name: "Muaad", phone_number: "254722654456", company_id: companies(:bank).id, department_id: departments(:one).id }
    assert_response :success

    points_before = users(:bank).points_available
    assert 30 == points_before

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
