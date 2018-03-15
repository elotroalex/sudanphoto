require 'rspec'
require 'selenium/webdriver'
require 'capybara/dsl'
require 'rack/jekyll'
require 'chromedriver/helper'

RSpec.configure do |config|
  config.include Capybara::DSL

  Chromedriver.set_version "2.36"

  Capybara.register_driver :headless_chrome do |app|
    capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: { 'args' => %w{headless disable-gpu} }
    )
    Capybara::Selenium::Driver.new(app, browser: :chrome, desired_capabilities: capabilities)
  end

  Capybara.javascript_driver = :headless_chrome
  Capybara.current_driver = Capybara.javascript_driver
  Capybara.app = Rack::Jekyll.new(:force_build => false)
end
