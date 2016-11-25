RSpec.configure do |config|
  config.before type: :controller do
    request.env['HTTP_ACCEPT'] = 'application/json'
  end
end
