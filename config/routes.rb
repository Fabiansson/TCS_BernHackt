Rails.application.routes.draw do
  get 'sessions/new'
  root 'sessions#new'
  resources :adverts, only: [:index, :show, :new, :create, :destroy]
  resources :games
  resources :seasonpasses do
    collection do
      get :index
      get :new
      post :create
    end
    member do
      get :show
      post :buy
    end
  end
  resources :clubs, only: [:show]
  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
