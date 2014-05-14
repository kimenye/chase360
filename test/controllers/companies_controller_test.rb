require "test_helper"

class CompaniesControllerTest < ActionController::TestCase
  def test_index_returns_all_companies
    get :index
  end
  
  def test_call_products_and_categories_for_existing_company
    get :show, id: companies(:one)
    assert JSON(response.body)['company_id'] == companies(:one).id, "does not return company id"
    assert JSON(response.body)['company_name'] == companies(:one).name, "does not return company"
    assert JSON(response.body)['categories'].nil? == false, "does not return companies categories"
    assert JSON(response.body)['products'].nil? == false, "does not return companies products"
    assert JSON(response.body)['status'] == "success", "does not pass correct status"
  end
  
  def test_call_products_and_categories_for_non_existing_company
    get :show, id: 29
    assert JSON(response.body)['message'] == "Company does not exist", "does not error out for non-existant company"
    assert JSON(response.body)['status'] == "unprocessable_entity", "wrong fail status passed for non-existence company"
  end
end
