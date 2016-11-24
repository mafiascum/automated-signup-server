# Base controller class
class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions
end
