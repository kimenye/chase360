class CompaniesController < ApplicationController
  respond_to :json
  
  def show
    company = Company.find_by(name: params[:company_name])
    
    if company
      categories = company.categories.includes(:products)
      products = categories.collect{|c| c.products}
      render json: {company_name: company.name, categories: categories, products: products,  status: :success}
    else
      render json: {message: "Company does not exist", status: :unprocessable_entity}
    end
  end
end
