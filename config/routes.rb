Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Api Routes
  api_routes = lambda do
    resources :users, only: [:create]
    resources :appointments, only: [:index, :create]
  end

  # Route Namespacing
  namespace :api do
    namespace :v1, &api_routes
  end

end
