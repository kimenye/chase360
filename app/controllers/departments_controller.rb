class DepartmentsController < ApplicationController
  respond_to :json

  def index
    @departments = Department.all    
  end
end