require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # provides devise methods such as login_session
  include Devise::Test::IntegrationHelpers

  # removes noisy logs when launching tests
  Capybara.server = :puma, { Silent: true }

  Capybara.register_driver :headless_chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new(args: %w[headless window-size=1400,1000])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end

  Capybara.register_driver(:chrome) do |app|
    options = Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1400,1000])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end

  ENV["DEBUG"] ? driven_by(:chrome) : driven_by(:headless_chrome)
end
