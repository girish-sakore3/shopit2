class ApplicationController < ActionController::Base
  def not_found
    render json: { error: 'not_found', status: :not_found }
  end

  def unauthorized
    render json: { error: 'unauthorized access', status: :unauthorized }
  end
  
  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    # begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    # rescue ActiveRecord::RecordNotFound => e
    #   render json: { errors: e.message }, status: :unauthorized
    # rescue JWT::DecodeError => e
    #   render json: { errors: e.message }, status: :unauthorized
    # end
    byebug
  end
end
