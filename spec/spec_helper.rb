require 'rubygems'
require 'bundler'

Bundler.require :default, :development

Combustion.initialize!

require 'rspec/rails'
require 'capybara/rspec'

RSpec.configure do |config|
  config.include Capybara
  config.include Rails.application.routes.url_helpers
  config.include Rails.application.routes.mounted_helpers

  config.use_transactional_fixtures = true

  # enable filtering for examples
  config.filter_run :wip => nil
end
