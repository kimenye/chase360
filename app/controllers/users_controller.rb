class UsersController < ApplicationController
	respond_to :json

	def update
		# TODO
		render json: { id: params[:id].to_i, status: "success"}
	end
end
