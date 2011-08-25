class ActionDispatch::Routing::Mapper
  def dobro_for(*resources)
    options = resources.extract_options!

    resources.each do |res|
      Dobro.resources << res

      self.resources res, dobro_options_for(res).merge(options) do
        member { get :delete }
        yield if block_given?
      end
    end
  end

  private

  def dobro_options_for(resource)
    {
      :controller => 'dobro/application',
      :defaults   => {:resource => resource}
    }
  end
end
