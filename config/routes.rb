Rails.application.routes.draw do
  root to: 'things#index'
  resources :things
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
