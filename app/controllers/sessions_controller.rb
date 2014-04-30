class SessionsController < ApplicationController
  respond_to :json
  
  def create
    user = User.find_by_email(params[:email])
    
    if user
      session[:user_id] = user.id
      render json: {user_id: user.id, message: "You are logged in", status: :success}
    else
      render json: {message: "Email is invalid", status: :unprocessable_entity}
    end
  end

  def destroy
    session[:user_id] = nil
    render json: {message: "You are logged out", status: :success}
  end
end
