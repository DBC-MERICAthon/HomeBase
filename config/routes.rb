Rails.application.routes.draw do

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resources :users do
    get '/lights_on' => 'lightbulbs#lights_on', :as => 'lights_on'
    get '/lights_off' => 'lightbulbs#lights_off', :as => 'lights_off'
  end

  get 'home/index'
  root 'home#index'

end
