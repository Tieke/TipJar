Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resources :users, only: [:index, :show]

  resources :tips, only: [:index, :show]

  get 'tips/:recipient_id/new', to: 'tips#new'

  get 'tips/:tippee_token', to: 'tips#create'

  get 'users/:user_id/transactions', to: 'users#transactions'

  get 'users/:user_id/tips/given', to: 'tips#given'

  get 'users/:user_id/tips/received', to: 'tips#received'

  get 'users/:user_id/token', to: 'tippees#token', as: :token 

  resources :tippees, only: [:new, :create]


  # transactions
  # 	create
  # 		#new
  # 		#create
  # 	read
  # 		#show
  # 		#index
  # 	update
  # 		#edit
  # 		#update
  # 	delete
  # 		#delete
  # 		#desroy
  # follows
  # 	create
  # 		#new
  # 		#create
  # 	read
  # 		#show
  # 		#index
  # 	update
  # 		#edit
  # 		#update
  # 	delete
  # 		#delete
  # 		#desroy
end
