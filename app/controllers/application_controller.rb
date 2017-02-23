# Base controller class
class ApplicationController < ActionController::API
  respond_to :json

  include CanCan::ControllerAdditions
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate
  check_authorization

  attr_reader :current_user

  rescue_from CanCan::AccessDenied do
    head :forbidden
  end

  private

  def authenticate
    authenticate_or_request_with_http_token do |token|
      @current_user = User.find_by(token: token)
    end
  end
end
