require 'support/authentication_macros.rb'
RSpec.configure do |config|
  config.extend AuthenticationMacros, type: :controller
end
