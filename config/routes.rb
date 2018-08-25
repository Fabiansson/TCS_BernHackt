Rails.application.routes.draw do
  get 'sessions/new'
  resources :adverts
  resources :games
  resources :seasonpasses
  resources :clubs
  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
