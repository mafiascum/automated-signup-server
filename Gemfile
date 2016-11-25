source 'https://rubygems.org'

###
### Core
###

# This is a rails project
gem 'rails', '~> 5.0.0.1'
# Use Puma as the app server
gem 'puma', '~> 3.6.0'
# Easy JSON APIs
gem 'jbuilder', '~> 2.6.0'
# Local databases
gem 'sqlite3', '~> 1.3.12'
# Server databases
gem 'mysql2', '~> 0.4.4'

###
### Models
###

# Secure and easy tokens
gem 'has_secure_token', '~> 1.0.0'

###
### Controllers and Application Logic
###

# Use respond_to in controller and respond_with
gem 'responders', '~> 2.3.0'
# Authorization from CanCanCan
gem 'cancancan', '~> 1.15.0'

group :development do
  ###
  ### Refactoring
  ###

  # Use rubocop to check style
  gem 'rubocop', '~> 0.44.1', require: false
  # Check style for tests
  gem 'rubocop-rspec', require: false
  # Lock down the formatting of schema.rb
  gem 'fix-db-schema-conflicts', '~> 2.0.0'

  ###
  ### Security
  ###

  # Audit the gemfile for insecure gems
  gem 'bundler-audit', '~> 0.5.0', require: false
  # Scan the application for vulnerabilities
  gem 'brakeman', '~> 3.4.0', require: false

  ###
  ### Utilitly
  ###

  # Watches the filesystem for changes
  gem 'listen', '~> 3.1.5'
  # Keep the application loaded in the background
  gem 'spring', '~> 2.0.0'
  # Update spring using listen
  gem 'spring-watcher-listen', '~> 2.0.1'
end

group :development, :test do
  ###
  ### Debugging
  ###

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '~> 9.0.6', platform: :mri
  # Better printing of ruby objects
  gem 'awesome_print', '~> 1.7.0', require: 'ap'

  ###
  ### Testing
  ###

  # Replace rails testing with rspec
  gem 'rspec-rails', '~> 3.5.2'
  # Test controllers using assigns
  gem 'rails-controller-testing', '~> 1.0.1'
  # Create database objects during testing with ease
  gem 'factory_girl_rails', '~> 4.7.0'
  # Clean the database in between tests
  gem 'database_cleaner', '~> 1.5.3'
  # Use FFaker for random value generation
  gem 'ffaker', '~> 2.2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
