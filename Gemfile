source 'https://rubygems.org'
ruby '2.1.2'

gem 'rails', '~> 4.1.4'

#gem 'activerecord-postgis-adapter'
gem 'autoprefixer-rails'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'bower-rails'
gem 'devise'
gem 'faraday'
gem "font-awesome-rails"
gem 'friendly_id'
gem 'geocoder'
gem 'jquery-rails'
gem 'nokogiri' # for premailer
gem 'pg'
gem 'phony_rails'
gem 'premailer-rails'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'tms_client', require: 'tms_client/mail/delivery_method'
gem 'twilio-ruby'

group :development do
  gem 'guard-livereload', require: false
  gem 'guard-rspec', require: false
  gem 'spring'
  gem "better_errors"
  gem "binding_of_caller"
end

group :linux do
  gem 'libnotify'
end

group :osx do
  gem 'terminal-notifier-guard'
end


group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'faker'
  gem 'launchy'
  gem 'poltergeist'
  gem 'selenium-webdriver'
end

group :production do
  gem 'rails_12factor'
end

gem 'unicorn'

