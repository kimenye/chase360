class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, :if => Proc.new { |c| c.request.format == 'application/json' }
  skip_before_action :verify_authenticity_token 
  # respond_to :json
  
  def authorize
    render json: {message: "You must be signed in to access that page"} if current_user.nil?
  end
  
  def authenticate_admin
    @current_user ||= User.find_by_email(params[:email]) 
    
    if @current_user && @current_user.backend_admin?
      session[:user_id] = user.id
      return true
    end
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
  
  private
    
    def current_admin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    helper_method :current_admin
    

end
