Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :users, except: [:new, :create] do
  	resources :tips, except: [:edit, :update, :destroy]
  end

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
