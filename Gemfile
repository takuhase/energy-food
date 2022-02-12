source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.2'
gem 'mysql2', '>= 0.4.4', '< 0.6.0', groups: %w(test development), require: false
gem 'pg', '~> 0.19.0', group: :production, require: false
gem 'puma', '~> 5.6'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
# login
gem 'devise'
# Japanese version
gem 'rails-i18n', '~> 5.1'
gem 'devise-i18n'
# Bootstrap
gem 'bootstrap', '~> 4.4.1'
gem 'jquery-rails'
gem 'devise-bootstrap-views', '~> 1.0'
# Gen dummy data
gem 'faker'
# Debug
gem 'pry'
gem 'pry-byebug'
gem 'pry-doc'
gem 'pry-rails'
gem 'pry-stack_explorer'
# Icons
gem 'font-awesome-sass'
# Count Likes
gem 'counter_culture', '~> 2.0'
# For pagination
gem 'will_paginate', '3.1.7'
gem 'bootstrap-will_paginate', '1.0.0'
gem 'activeadmin'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # RSpec for test automation
  gem 'rspec-rails', '~> 3.6.0'
  # Rubocop for coding analysis
  gem 'rubocop-airbnb'
  # Gen test data for RSpec
  gem "factory_bot_rails"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  # Solution for N + 1 problem
  gem 'bullet'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end
