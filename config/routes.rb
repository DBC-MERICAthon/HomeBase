Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'user_data', to: 'home#user_data', as: 'user_data'

  resources :sessions, only: [:create, :destroy]
  resources :users
  resources :lightbulbs


  get 'home/index'
  root 'home#index'

end