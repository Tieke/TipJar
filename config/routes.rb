Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:index, :show] do
  	resources :tips, except: [:edit, :update, :destroy, :show, :index]
  end

  resources :tips, only: [:index, :show]

  get 'users/:user_id/tips/given', to: 'tips#given'

  get 'users/:user_id/tips/received', to: 'tips#received'

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
