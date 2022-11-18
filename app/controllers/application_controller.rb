class ApplicationController < ActionController::API
  before_action :authenticate_user
  include ActionController::Cookies
  

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  
  def login_user
    session[:user_id]=@user_id
  end
  private 

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) #memoization
    # User.find_by_id(session[:user_id])
  end

  def authenticate_user #we're checking if a user is logged in only
  # @current_user = User.find_by_id(session[:user_id])
  render json: { error: ["Not authorized"] }, status: :unauthorized unless current_user
  end

  def render_not_found(error)
    render json: { error: ["Not found"]}, status: :not_found

  end
  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

end
