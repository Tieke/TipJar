Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:index, :show]

  resources :tips, only: [:index, :show]

  get 'users/:user_id/tips/given', to: 'tips#given'

  get 'users/:user_id/tips/received', to: 'tips#received'

  get 'tips/new', to: 'tips#new'

  post 'tips/:tippee_id', to: 'tips#create'

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
