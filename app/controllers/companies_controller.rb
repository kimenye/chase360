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
  end
end
