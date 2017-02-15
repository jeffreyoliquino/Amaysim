require 'capybara'
require 'capybara/cucumber'
require 'rspec/expectations'
require 'selenium-cucumber'


require File.dirname(__FILE__) + '/lib/configuration';
BASE_URL = Configuration["url"]

Capybara.configure do |config|
  config.default_driver = :chrome
  config.app_host   = BASE_URL
end

Capybara.register_driver :chrome do |app|
client = Selenium::WebDriver::Remote::Http::Default.new 
    client.timeout = 240
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :http_client => client)
end
Capybara.javascript_driver = :chrome

Capybara.ignore_hidden_elements = true 

World(Capybara)
