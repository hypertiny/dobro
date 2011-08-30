require 'rubygems'
require 'bundler'

Bundler.require :default, :development

Combustion.initialize!

require 'rspec/rails'
require 'capybara/rspec'

RSpec.configure do |config|
  config.use_transactional_fixtures = true

  # enable filtering for examples
  config.filter_run :wip => nil
end
