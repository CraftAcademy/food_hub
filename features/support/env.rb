require 'coveralls'
Coveralls.wear_merged!('rails')

require 'cucumber/rails'

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

Chromedriver.set_version('2.36')

Capybara.register_driver(:selenium) do |app|
  options = Selenium::WebDriver::Chrome::Options.new(
      args: %w(  no-sandbox disable-popup-blocking disable-infobars headless)
  )
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Cucumber::Rails::Database.javascript_strategy = :truncation
Capybara.javascript_driver = :selenium

World(FactoryBot::Syntax::Methods)

Before do
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(OmniAuthFixtures.facebook_response)
end
