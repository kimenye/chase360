require "test_helper"

class SessionsControllerTest < ActionController::TestCase
  def test_sign_in_with_correct_creds
    post :create, {email: "email@www.com"}
    assert JSON(response.body)['user_role'] == users(:one).role_name
    assert JSON(response.body)['user_email'] == users(:one).email
    assert JSON(response.body)['message'] == "You are logged in", "sign in does not pass correctly"
    assert JSON(response.body)['status'] == "success", "sign in does not pass correct status"
  end
  
  def test_sign_in_with_incorrect_creds
    post :create, {email: "no_email@www.com"}
    assert response.body == "{\"message\":\"Email is invalid\",\"status\":\"unprocessable_entity\"}", "sign in does not fail correctlly"
  end
  
  def test_sign_out
    delete :destroy
    assert response.body == "{\"message\":\"You are logged out\",\"status\":\"success\"}", "log out does not pass correctly"
  end

end
