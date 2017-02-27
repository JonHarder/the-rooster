Rails.application.routes.draw do
  resources :ingredients
  resources :pantry_entries
  resources :units
  root 'ingredients#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
