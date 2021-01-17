Rails.application.routes.draw do
  get 'reports/daily'
  get 'reports/weekly'
  get 'loads/daily'
  post 'loads/daily', to: "loads#create_daily", as: "loads_create_daily"
  get 'loads/weekly'
  post 'loads/weekly', to: "loads#create_weekly", as: "loads_create_weekly"
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
