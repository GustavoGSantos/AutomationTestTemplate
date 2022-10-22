# frozen_string_literal: true

require 'capybara/cucumber'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
require 'report_builder'
require 'site_prism'
require 'uri'
require 'webdrivers/chromedriver'

require_relative 'helper'
require_relative 'page_helper'
require_relative 'api_helper'

# Configuring global modules
World(Capybara::DSL)
World(Capybara::RSpecMatchers)
World(Pages)
World(Helper)
World(Api)

BROWSER = ENV['BROWSER']
ENVIRONMENT = ENV['ENVIRONMENT']

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/Environment/#{ENVIRONMENT}.yml")

@driver = if BROWSER.eql?('chrome')
            :selenium_chrome
          else
            :selenium_chrome_headless
          end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome # Configuring webdriver
  config.app_host = CONFIG['defaultUrl'] # Configuring default url
  config.default_max_wait_time = 5 # Default wait time in seconds
  if BROWSER.eql?('chrome')
    Capybara.page.driver.browser.manage.window.maximize
  else
    Capybara.page.driver.browser.manage.window.resize_to 1920, 1080
  end
end
