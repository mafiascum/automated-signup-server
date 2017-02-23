# Base controller class
class ApplicationController < ActionController::API
  respond_to :json

  include CanCan::ControllerAdditions
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate
  before_action :set_default_request_format
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

  def set_default_request_format
    request.format = :json unless params[:format]
  end
end
