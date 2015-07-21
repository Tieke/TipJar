Rails.application.routes.draw do
  devise_for :users#, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root to: "pages#home"

  get 'users/topup', to: 'users#topup'

  get 'users/withdraw', to: 'users#withdraw'

  get 'users/withdraw_confirmation', to: 'users#withdraw_confirmation', as: :withdraw_confirmation

  resources :users, only: [:index, :show]

  resources :tips, only: [:index, :show]

  resources :bit_pay_clients

  # get 'users/:user_id/purchase', to: 'users#initiate_coinbase', as: :purchase

  # post 'users/:user_id/retrieve', to: 'users#retrieve_checkout'
  get 'browse', to: 'pages#page'

  # get 'users/:user_id/transfer', to: 'users#transfer'

  get 'template', to: 'pages#page'

  get 'tips/:recipient_id/new', to: 'tips#new'

  get 'tips/create/:tippee_token', to: 'tips#create'

  get 'users/:user_id/transactions', to: 'users#transactions'

  get 'users/:user_id/tips/given', to: 'tips#given'

  get 'users/:user_id/tips/received', to: 'tips#received'

  get 'users/:user_id/token', to: 'tippees#token', as: :display_token

  get 'users/:user_id/tip_settings', to: 'users#tip_settings', as: :tip_settings

  resources :tippees, only: [:new, :create]

  resources :tippers, only: [:update]

end
