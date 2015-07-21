Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"


  resources :users, only: [:index, :show]

  resources :tips, only: [:index, :show]

  get 'browse', to: 'pages#page'

  get 'tips/:recipient_id/new', to: 'tips#new'

  get 'tips/create/:tippee_token', to: 'tips#create'

  get 'users/:user_id/transactions', to: 'users#transactions'

  get 'users/:user_id/tips/given', to: 'tips#given'

  get 'users/:user_id/tips/received', to: 'tips#received'

  get 'users/:user_id/token', to: 'tippees#token', as: :display_token

  resources :tippees, only: [:new, :create]

  get '/users/:user_id/follow', to: 'users#follow', as: :follow_user

  get '/users/:user_id/unfollow', to: 'users#unfollow', as: :unfollow_user

  get '/users/:user_id/followers', to: 'users#followers', as: :followers

  get '/users/:user_id/following', to: 'users#following', as: :following

end
