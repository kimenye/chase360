require "test_helper"

class UsersControllerTest < ActionController::TestCase
  def test_that_we_can_update_a_user_profile
  	
    post :update,  { first_name: "Muaad", phone_number: "254722654456", company_id: companies(:one).id, department: "Marketing", id: users(:one).id }
    
    assert_response :success

  	id = JSON(response.body)['id']
  	assert_equal id, users(:one).id

  	user = User.find(id)
  	assert_equal "Muaad", user.first_name
    assert_equal "254722654456", user.phone_number
  	assert_equal companies(:one).id, user.company.id
  	assert_equal "Marketing", user.department
  end
end
