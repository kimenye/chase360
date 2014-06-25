class UsersController < ApplicationController
	respond_to :json

	def show
		@user = User.find_by(id: params[:id])
	end

	def update
		# TODO
		params[:setup] = true
		@user = User.find(params[:id])
		@user.update user_params
		# @user.setup = true
		# @user.save!
		render json: { id: params[:id].to_i, status: "success"}
	
	end
	private
		def user_params
	      params.permit(:phone_number, :name, :email, :company_id, :department, :setup)
	    end
	
end
