Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :users, only: [:index, :show]

  get 'tips/random', to: 'tips#random', as: :tips_random

  resources :tips, only: [:index, :show]

  get 'browse', to: 'pages#page'

  get 'tips/:recipient_id/new', to: 'tips#new'

  get 'tips/create/:tippee_token', to: 'tips#create'


  get 'users/:user_id/transactions', to: 'users#transactions'

  get 'users/:user_id/tips/given', to: 'tips#given'

  get 'users/:user_id/tips/received', to: 'tips#received'

  get 'users/:user_id/token', to: 'tippees#token', as: :display_token

  resources :tippees, only: [:new, :create]

end
