require 'rspec'
require 'capybara/poltergeist'
require 'capybara/dsl'
require 'rack/jekyll'
require 'rack/test'

RSpec.configure do |config|
  config.include Capybara::DSL

  $config = YAML.load_file('_config.yml')
  $baseurl = $config['baseurl'].to_s
  $search_tests = $config['quoll']

  Capybara.current_driver = :poltergeist
  Capybara.javascript_driver = :poltergeist
  Capybara.app = Rack::Jekyll.new(:force_build => false)
end
