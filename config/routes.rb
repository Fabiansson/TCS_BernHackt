Rails.application.routes.draw do
  get 'sessions/new'
  root 'sessions#new'
  resources :adverts, only: [:index, :show, :new, :create, :destroy]
  post '/adverts/:id', to: 'adverts#buy'
  resources :games
  resources :seasonpasses do
    collection do
      get :index
      get :new
      post :create
    end
    member do
      get :show
      post :offer
    end
  end
  resources :clubs, only: [:show]
  resources :users

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
