class LeadsController < ApplicationController
	respond_to :json

	def index
		if params[:submitted_by_id].present?
			# @leads = Lead.
		else
    		@leads = Lead.all
    	end
    	render json: @leads
	end

	def create
		@lead = Lead.new(lead_params)
		@lead.status = "New"

		if @lead.save

			if params[:message].present?
				Note.create! message: params[:message], user_id: params[:submitted_by_id], lead: @lead
			end

			render json: { id: @lead.id }		
		else
			render json: {message: "Please check either your name, email address or phone_number" }, status: :unprocessable_entity
		end
	end

	def close
		# @lead = Lead.f
	end

	private
		def lead_params
	      params.permit(:phone_number, :name, :email, :submitted_by_id, :product_id, :branch_id)
	    end
end
