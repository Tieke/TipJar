Rails.application.routes.draw do
  devise_for :users#, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: "pages#home"

  get 'users/topup', to: 'users#topup'

  resources :users, only: [:index, :show]

  resources :tips, only: [:index, :show]

  resources :bit_pay_clients

  # get 'users/:user_id/purchase', to: 'users#initiate_coinbase', as: :purchase

  # post 'users/:user_id/retrieve', to: 'users#retrieve_checkout'

  get 'users/:user_id/transfer', to: 'users#transfer'

  get 'template', to: 'pages#page'

  get 'browse', to: 'pages#page'

  get 'tips/:recipient_id/new', to: 'tips#new'

  get 'tips/create/:tippee_token', to: 'tips#create'

  get 'users/:user_id/transactions', to: 'users#transactions'

  get 'users/:user_id/tips/given', to: 'tips#given'

  get 'users/:user_id/tips/received', to: 'tips#received'

  get 'users/:user_id/token', to: 'tippees#token', as: :display_token

  resources :tippees, only: [:new, :create]

end
