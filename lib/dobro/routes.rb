class ActionDispatch::Routing::Mapper
  def dobro_for(*resources)
    options = resources.extract_options!
    outer_module, @scope[:module] = @scope[:module], nil

    resources.each do |res|
      Dobro.resources[res] = Dobro::Resource.new(res, :namespace => outer_module)

      self.resources res, dobro_options_for(res).merge(options) do
        member { get :delete }
        yield if block_given?
      end
    end

    @scope[:module] = outer_module
  end

  private

  def dobro_options_for(resource)
    {
      :controller => 'dobro/application',
      :defaults   => {:resource => resource}
    }
  end
end
