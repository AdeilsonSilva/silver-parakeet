Rails.application.routes.draw do

# Root routes
  constraints -> (request) { request.session[:user_id].present? } do
    root to: 'users#show', as: :authenticated_root
  end
  root to: 'sessions#new'

# Named routes
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

# Resources
  resources :reserves
  resources :material_reserve_has_armaments
  resources :material_reserve_has_ammunitions
  resources :material_reserve_has_accessories
  resources :material_reserves
  resources :loans
  resources :armaments
  resources :ammunitions
  resources :accessories
  resources :soldiers
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
