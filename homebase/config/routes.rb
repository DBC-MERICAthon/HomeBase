Rails.application.routes.draw do

  resources :families do
    resources :users
  end
  # root 'users#index'

end
