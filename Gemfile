source 'https://rubygems.org'

# Padrino supports Ruby version 2.2.2 and later
# ruby '2.5.1'

# Distribute your app as a gem
# gemspec

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem 'rake'
gem 'dotenv'
gem 'grape'
gem 'grape-entity'

# Component requirements
gem 'activerecord', '~> 5.2', :require => 'active_record'
gem 'pg'

gem 'padrino-core', '0.14.4'
gem 'padrino-gen', '0.14.4'

group :development, :test do
  gem 'pry'
  gem 'rb-readline'
  gem 'faker'
end

# Test requirements
group :test do
  gem 'rspec'
  gem 'rspec_junit_formatter'
  gem 'rack-test', :require => 'rack/test'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'factory_bot'
  gem 'database_cleaner'
  gem 'timecop'
  gem 'capybara'
  gem 'simplecov', require: false # Code coverage
end