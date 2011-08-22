class Dobro::FileSystemResolver < ActionView::FileSystemResolver
  attr_reader :resource

  def initialize(path, resource)
    @resource = resource

    super path
  end

  def find_templates(name, prefix, partial, details)
    prefix = "dobro/#{resource}" if prefix == 'dobro/application'
    super name, prefix, partial, details
  end
end
