Rails.application.routes.draw do
  
  resources :users, only: [:index, :show, :create]
  resources :wineries, only: [:index, :show, :create]
  resources :bottles, only: [:index, :show, :create, :update, :destroy]
  
  post '/login', to: 'sessions#create'
  post '/signup', to: 'users#create'
  get '/me', to: 'users#show'
  delete '/logout', to: 'sessions#destroy'

  
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
