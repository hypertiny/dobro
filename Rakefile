require 'rubygems'
require 'bundler'

Bundler.require :default, :development
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

task :default => :test
task :test    => :spec
