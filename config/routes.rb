Dobro::Engine.routes.draw do
  Dobro.resources.each do |res|
    resources res, :controller => 'application', :defaults => {
      :resource => res
    } do
      member { get :delete }
    end
  end
end
