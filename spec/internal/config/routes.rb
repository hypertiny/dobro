Rails.application.routes.draw do
  root :to => 'dobro/application#index'

  dobro_for :pages, :widgets
  dobro_for :tasks, :controller => 'tasks' do
    member do
      get :approving
      put :approve
    end
  end

  namespace :admin do
    dobro_for :authors
  end

  scope 'my', :as => 'my' do
    dobro_for :links
  end
end
