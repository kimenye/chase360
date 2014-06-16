class LeadsController < ApplicationController
	respond_to :json

	def index
		# @companies = Company.all
    	# render json: @companies, only: [:id, :name, :description, :image_url]
    	@leads = Lead.all
    	render json: @leads
	end
end
