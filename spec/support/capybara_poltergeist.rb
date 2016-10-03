# frozen_string_literal: true
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
  options = {
    url_whitelist:  []
  }
  Capybara::Poltergeist::Driver.new(app, options)
end

Capybara.javascript_driver = :poltergeist
