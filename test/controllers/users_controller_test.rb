require "test_helper"

class UsersControllerTest < ActionController::TestCase
  def test_that_we_can_update_a_user_profile
  	
    stub_request(:post, "https://#{ENV['push_username']}:#{ENV['push_password']}@pushapi.infobip.com/3/application/0a7535fbb603/message").
            with(:body => "{\"sentType\":\"userIDs\",\"mimeType\":\"text/plain\",\"OSTypes\":[\"Android\"],\"notificationMessage\":\"You have been awarded 30 Miles.\",\"androidData\":{\"title\":\"You have been awarded 30 Miles.\"},\"additionalInfo\":{\"reason\":\"Installing 360 Me\",\"user_id\":980190962,\"miles\":30,\"total_miles\":40,\"notification_type\":\"MilesAwarded\"},\"userIDs\":[\"email@www.com\"]}",
                 :headers => {'Content-Type'=>'application/json'}).
            to_return(:status => 200, :body => "", :headers => {})

    before = users(:one).setup
    assert_equal nil, before
    post :update,  {name: "Muaad", phone_number: "254722654456", company_id: companies(:one).id, department_id: departments(:one).id, id: users(:one).id }
    
    assert_response :success

  	id = JSON(response.body)['id']
  	assert_equal id, users(:one).id

  	user = User.find(id)
    assert_equal true, user.setup
  	assert_equal "Muaad", user.name
    assert_equal "254722654456", user.phone_number
  	assert_equal companies(:one).id, user.company.id
  	assert_equal departments(:one).name, user.department.name
  end

  def test_that_we_can_get_a_user_profile

    get :show, id: users(:one), format: :json
    assert_response :success

    assert JSON(response.body)['id'] == users(:one).id, "does not return user id"
    assert JSON(response.body)['points_available'] == 10, "does not return correct available_points"
  end

  def test_that_we_can_get_all_users_who_are_relationship_officers
    get :relationship_officers, id: companies(:chase_assurance), format: :json
    assert_response :success

    assert JSON(response.body)['users'].first['id'] == users(:chase_assurance_ro).id, "does not return user id"
  end
end
