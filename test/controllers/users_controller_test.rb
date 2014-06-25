require "test_helper"

class UsersControllerTest < ActionController::TestCase
  def test_that_we_can_update_a_user_profile
  	
    before = users(:one).setup
    assert_equal nil, before
    post :update,  {name: "Muaad", phone_number: "254722654456", company_id: companies(:one).id, department: "Marketing", id: users(:one).id }
    
    assert_response :success

  	id = JSON(response.body)['id']
  	assert_equal id, users(:one).id

  	user = User.find(id)
    assert_equal true, user.setup
  	assert_equal "Muaad", user.name
    assert_equal "254722654456", user.phone_number
  	assert_equal companies(:one).id, user.company.id
  	assert_equal "Marketing", user.department
  end

  def test_that_we_can_get_a_user_profile

    get :show, id: users(:one), format: :json
    assert_response :success

    assert JSON(response.body)['id'] == users(:one).id, "does not return user id"
    assert JSON(response.body)['points_available'] == 10, "does not return correct available_points"
  end
end
