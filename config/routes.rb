Rails.application.routes.draw do
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
