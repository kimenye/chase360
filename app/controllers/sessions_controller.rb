class SessionsController < ApplicationController
  respond_to :json
  
  def create
    user = User.find_by(email: params[:email])
    
    if user
      session[:user_id] = user.id
      render json: {user_id: user.id, user_email: user.email, user_role: user.role_name, message: "You are logged in", status: :success, setup: user.setup}
    else
      # check if the user is valid
      if !User.is_allowed?(params[:email])
        render json: {message: "Email is invalid", status: :unprocessable_entity}
      else
        user = User.create! email: params[:email], setup: false
        render json: {user_id: user.id, user_email: user.email, user_role: user.role_name, message: "You are logged in", status: :success, setup: user.setup}
      end
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {message: "You are logged out", status: :success}
  end
end
