Rails.application.routes.draw do
  root 'pages#home'
  resources :clubs do
    resources :comments, only: [:create, :destroy, :index]
  end
  resources :books, only: [:show]
  resources :memberships, only: [:create, :destroy]
  get '/profile', to: 'users#show', as: 'profile'
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
