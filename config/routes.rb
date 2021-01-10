Rails.application.routes.draw do
  resources :vacations
  resources :consultants
  resources :teams
  resources :reasons
  resources :days
  resources :weeks
  resources :months
  resources :years
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
