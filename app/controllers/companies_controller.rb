class CompaniesController < ApplicationController
  respond_to :json
  
  def show
    company = Company.find_by(name: params[:company_name])
    if company
      render json: {company_name: company.name, categories_and_products: company.categories.includes(:products),  status: :success}
    else
      render json: {message: "Company does not exist", status: :unprocessable_entity}
    end
  end
end
