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

	def relationship_officers
		company = Company.find(params[:id])
		users = []
		Role.find_by(name: "Relationship Officer").users.each do |user|
			if user.company = company
				users << user
			end
		end
		render json: {users: users}
	end

	# GET /users/1/feed
	def feed
		@user = User.find(params[:id])
		# get a feed of recent data
		@new_users = User.where(company_id: @user.company_id).order(created_at: :desc).first(5)
		@new_users.reject! { |u| u.id == @user.id }
		# binding.pry

	end

	private
		def user_params
	      params.permit(:phone_number, :name, :email, :company_id, :department_id, :setup, :image)
	    end
	
end
