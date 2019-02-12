RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")
I18n.load_path += Dir[File.join(File.dirname(__FILE__), '..', 'app/locale', '/**/*.{rb,yml}')]
Dir[File.expand_path(File.dirname(__FILE__) + "/../app/helpers/**/*.rb")].each(&method(:require))

RSpec.configure do |conf|
  conf.include Rack::Test::Methods

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :active_record
    end
  end

  conf.include(Shoulda::Matchers::ActiveModel, type: :model)
  conf.include(Shoulda::Matchers::ActiveRecord, type: :model)
  conf.include FactoryBot::Syntax::Methods

  conf.before(:suite) do
    FactoryBot.find_definitions
  end

  conf.before(:each) do
    DatabaseCleaner[:active_record].strategy = :transaction
  end

  conf.before(:each) do
    DatabaseCleaner[:active_record].start
  end

  conf.after(:each) do
    Timecop.return
    DatabaseCleaner[:active_record].clean
  end
end

# You can use this method to custom specify a Rack app
# you want rack-test to invoke:
#
#   app Sehati::App
#   app Sehati::App.tap { |a| }
#   app(Sehati::App) do
#     set :foo, :bar
#   end
#
def app(app = nil, &blk)
  @app ||= block_given? ? app.instance_eval(&blk) : app
  @app ||= Padrino.application
end
