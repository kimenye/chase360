class CompaniesController < ApplicationController
  respond_to :json
  
  def index
    @companies = Company.all    
  end
  
  def show
    @company = Company.find_by(id: params[:id])
    if !@company
      render json: {message: "Company does not exist", status: :unprocessable_entity}
    end

    # company = Company.find_by(id: params[:id])    
    # if company
    #   # categories = company.categories.includes(:products)
    #   # branchs = company.branches.includes(:branches)
    #   # products = categories.collect{|c| c.products}

    #   render json: {company_id: company.id, company_name: company.name, branches: company.branches, products: company.products,  status: :success}
    # else
    #   render json: {message: "Company does not exist", status: :unprocessable_entity}
    # end
  end
end
