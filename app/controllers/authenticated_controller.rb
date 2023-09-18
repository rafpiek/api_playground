class AuthenticatedController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :set_current_request_details
  before_action :authenticate

  def index
    role = "Identity::#{Current.session.role.classify}".constantize
    render json: { message: 'You are authenticated!', user: Current.user }
  end

  private

  def authenticate
    if session_record = authenticate_with_http_token { |token, _| Session.find_signed(token) }
      if session_record.expired?
        session_record.destroy
        render json: { error: "session_expired" }, status: 401
      else
        Current.session = session_record
        Current.user = session_record.user
      end
    else
      request_http_token_authentication
    end
  end

  def set_current_request_details
    Current.user_agent = request.user_agent
    Current.ip_address = request.ip
  end
end
