class CompaniesController < ApplicationController
  respond_to :json
  
  def index
    @companies = Company.all
    render json: @companies, only: [:id, :name, :description, :image_url]
  end
  
  def show
    company = Company.find_by(id: params[:id])
    
    if company
      categories = company.categories.includes(:products)
      products = categories.collect{|c| c.products}
      render json: {company_id: company.id, company_name: company.name, categories: categories, products: products,  status: :success}
    else
      render json: {message: "Company does not exist", status: :unprocessable_entity}
    end
  end
end
