RealEstate::Application.routes.draw do
  devise_for :users, :controllers => { :sessions => "users/sessions" } do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
  end

  resources :owners
  resources :tenants
  resources :properties
  resources :rents

	root :to => "owners#index"    
end
