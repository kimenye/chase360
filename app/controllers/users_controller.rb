class UsersController < ApplicationController
	respond_to :json

	def show
		@user = User.find_by(id: params[:id])
	end

	def update
		# TODO
		render json: { id: params[:id].to_i, status: "success"}
	end
end
