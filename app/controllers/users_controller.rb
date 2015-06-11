class UsersController < ApplicationController
	respond_to :json

	def show
		@user = User.find_by(id: params[:id])
	end

	def edit
		@user = User.find_by(id: params[:id])
	end

	def update
		params[:setup] = true
		@user = User.find(params[:id])
		@user.update user_params

		points = ChasePoint.create! user: @user, action: "Installation", amount: 30, redeemed: false
		@user.reload

		if Rails.env.production?
			Push.send @user.email, "You have been awarded 30 Miles.", {
				reason: "Installing 360 Me",
				user_id: @user.id,
				miles: 30,
				total_miles: @user.points_available,
				notification_type: "MilesAwarded"
			}
		end

		respond_to do |format| 
			format.json { render json: { id: params[:id].to_i, status: "success"} }
			format.html { redirect_to @user, notice: 'Profile updated.' }
		end
	
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
		
		@assigned_leads = Lead.where(assigned_to_id: params[:id]).order(created_at: :desc).first(5)

	end

	private
		def user_params
	      params.permit(:phone_number, :name, :email, :company_id, :department_id, :setup, :image)
	    end
	
end
