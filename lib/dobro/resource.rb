class Dobro::Resource
  attr_accessor :reference, :options

  def initialize(reference, options = {})
    @reference, @options = reference, options
  end

  def index_route
    [namespace, reference].compact
  end

  def route_for(action, object = nil)
    action, object = nil, action if object.nil?
    [action, namespace, object].compact
  end

  private

  def namespace
    options[:namespace]
  end
end
