require 'rspec'
require 'selenium/webdriver'
require 'capybara/dsl'
require 'rack/jekyll'

RSpec.configure do |config|
  config.include Capybara::DSL

  Capybara.register_driver :headless_chrome do |app|
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: { 'args' => %w{headless no-sandbox disable-gpu} }
    )
    Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
  end

  Capybara.javascript_driver = :headless_chrome
  Capybara.current_driver = Capybara.javascript_driver
  Capybara.app = Rack::Jekyll.new(:force_build => false)
end
