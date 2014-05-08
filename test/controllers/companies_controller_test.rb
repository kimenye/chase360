require "test_helper"

class CompaniesControllerTest < ActionController::TestCase
  def test_call_products_and_categories_for_existing_company
    get :show, company_name: "company_one"
    assert JSON(response.body)['company_name'] == companies(:one).name, "does not return company"
    assert JSON(response.body)['categories_and_products'].nil? == false, "does not return companies categories and products"
    assert JSON(response.body)['status'] == "success", "does not pass correct status"
  end
  
  def test_call_products_and_categories_for_non_existing_company
    
    get :show, company_name: "company_three"
    assert JSON(response.body)['message'] == "Company does not exist", "does not error out for non-existant company"
    assert JSON(response.body)['status'] == "unprocessable_entity", "wrong fail status passed for non-existence company"
  end
end
