source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'


# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

#for images:
gem 'dragonfly', '~> 1.0.4'
gem 'dragonfly-s3_data_store'

#for environment variables
gem 'figaro'

#active_admin
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'active_admin_import_anything'
gem 'simple_xlsx_reader'
gem 'devise'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'haml-rails'
gem 'foundation-rails'
gem 'groupdate'  
gem 'chartkick' 
gem 'google_visualr'
gem 'httparty'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test do
  gem 'rails_layout'
  gem 'annotate'
  # gem 'guard-minitest'
  #for capybara
  gem 'minitest-rails-capybara'

  gem 'ruby-prof'
  #for integration testing
  gem 'capybara'
  #for headless testing
  gem 'capybara-webkit'
  #improving tests’ output
  # gem 'turn'
  #to open wwebpages while testing
  gem 'launchy'
  gem 'database_cleaner'
  #check test coverage
  gem 'simplecov', :require => false
  # To use debugger
  gem 'debugger'
  gem 'sqlite3'
  gem 'webmock'
  gem 'minitest'
end

group :development do
  gem 'pry'
  gem 'pry-nav'
end

group :production do
 
  # Rails 12factor
  # Makes running your Rails app easier. Based on the ideas behind 12factor.net
  # Needed for support of Asset Pipeline with Heroku
  # https://github.com/heroku/rails_12factor
  # gem 'rails_12factor'

  # Use mysql as the database for Active Record
  gem 'mysql2'
end

ruby "2.1.0"
