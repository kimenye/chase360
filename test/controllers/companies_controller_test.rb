require "test_helper"

class CompaniesControllerTest < ActionController::TestCase
  def test_index_returns_all_companies
    get :index, :format => :json
  end
  
  def test_call_and_existing_company  
    get :show, id: companies(:one), format: :json
    assert JSON(response.body)['id'] == companies(:one).id, "does not return company id"
    assert JSON(response.body)['name'] == companies(:one).name, "does not return company"      
  end
  
  def test_call_a_non_existing_company
    get :show, id: 29, format: :json
    assert JSON(response.body)['message'] == "Company does not exist", "does not error out for non-existant company"
    assert JSON(response.body)['status'] == "unprocessable_entity", "wrong fail status passed for non-existence company"
  end
end
