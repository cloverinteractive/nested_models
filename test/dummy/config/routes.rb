Dummy::Application.routes.draw do
  resources :authors

  root :to => 'authors#index'
end
