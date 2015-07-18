Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :users, only: [:index, :show]

  resources :tips, only: [:index, :show]

  post 'users/:user_id/purchase', to: 'users#purchase_checkout'

  post 'users/:user_id/retrieve', to: 'users#retrieve_checkout'

  get 'tips/:recipient_id/new', to: 'tips#new'

  get 'tips/:tippee_token', to: 'tips#create'

  get 'users/:user_id/transactions', to: 'users#transactions'

  get 'users/:user_id/tips/given', to: 'tips#given'

  get 'users/:user_id/tips/received', to: 'tips#received'

end
