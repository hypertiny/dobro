require 'rails'
require 'action_controller'
require 'decent_exposure'

module Dobro
  @resources = []
  def self.resources
    @resources
  end

  @controller_base = ::ActionController::Base
  def self.controller_base
    @controller_base
  end

  def self.controller_base=(value)
    @controller_base = value
  end
end

require 'dobro/engine'
require 'dobro/file_system_resolver'
require 'dobro/routes'
require 'dobro/version'
