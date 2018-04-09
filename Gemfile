# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 5.1.4"
# Use postgresql as the database for Active Record
gem "pg", "~> 0.18"
# Use Puma as the app server
gem "puma", "~> 3.7"
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.5"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem "bcrypt", "~> 3.1.7"

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors"

# Generates swagger-ui json files for Rails APIs with a simple DSL.
gem "swagger-blocks"

# Seamless JWT authentication for Rails API
gem "knock"
# Use Rolify for role management library with resource scoping
gem "rolify"
# Use CanCanCan to define authorization roles
gem "cancancan"

# Gem to allow for custom representations of JSON responses
# gem "active_model_serializers"
gem "fast_jsonapi"

# Generates swagger-ui json files for Rails APIs with a simple DSL.
gem "swagger-blocks"

# Shim to load environment variables from .env into ENV in development
gem "dotenv-rails"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]

  # Use RSpec to execute specs suite
  gem "rspec-rails", "~> 3.6"
  # Use Factory Bot to create objects dynamically
  gem "factory_bot_rails"
  # Use to exec tests into controller with RSpec
  gem "rails-controller-testing"
  # RuboCop is a Ruby static code analyzer
  gem "rubocop", require: false
  # Use Faker to generate data dynamically
  gem "faker"
  # Ruby library that pretty prints Ruby objects in full color exposing
  gem "awesome_print"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  # Use to clean database before and after tests with RSpec
  gem "database_cleaner"
  # Use for codeclimate test coverage
  gem "simplecov", require: false
  gem "codeclimate-test-reporter", "~> 1.0.0"
  # Collection of testing matchers
  gem "shoulda-matchers", "~> 3.1"
  # Validate the JSON returned by your Rails JSON APIs
  gem "json_matchers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
