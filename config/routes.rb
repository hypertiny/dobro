Dobro::Engine.routes.draw do
  root :to => 'application#index'

  Dobro.resources.each do |res|
    resources res, :controller => 'application', :defaults => {
      :resource => res
    } do
      member { get :delete }
    end
  end
end
