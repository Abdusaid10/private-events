Rails.application.routes.draw do
  # get '/invite', to: 'invitations/new'
  get 'invitations/show'
  get 'invitations/new'
  get 'events/show'
  get 'events/index'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'users/show'
  get '/users', to: 'users#index'
  root 'events#index'
  resources :events
  resources :users
  resources :invitations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
