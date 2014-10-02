Jpt::Application.routes.draw do

  resources :kouteimasters

  # get "shozais/index"
  post "shozais/select"
	resources :shozais do
		collection do
			post :getAjax
			get :main
		end
	end
	# resources :users, only: [:create, :destroy, :update]

 #  resources :users do
	# 	# post :change_pass, on: :member
	# 	member do
	# 		# post :change_pass
	# 		post :change_name
	# 	end
	# 	collection do
	# 		post :change_pass
	# 	end
 #  end
	root to: 'users#login'
	post 'users/login'

	match 'login', to: 'users#create', via: [:post]
	match 'change_pass', to: 'users#change_pass', via: [:get,:post]
	match 'change_pass_exc', to: 'users#change_pass_exc', via: [:get,:post]

  # resources :tantoshas

  # resources :people

	# root to: 'tantoshas#index'

	# resources :login

	# match 'login/index', to: 'login#index', via: [:get, :post]
	# match 'login/logout', to: 'login#logout', via: [:get]
	# match 'login/edit', to: 'login#edit', via: [:get, :post]

	# match 'mb001/index', to: 'mb001#index', via: [:get, :post]
	# match 'mb001/edit', to: 'mb001#edit', via: [:get, :post]
	# match 'mb001/add', to: 'mb001#add', via: [:get, :post]
	# match 'mb001/create', to: 'mb001#create', via: [:post]
	# match 'mb001/getAjax', to: 'mb001#getAjax', via: [:post]

	# match 'main001/index', to: 'main001#index', via: [:get, :post]
	# match 'mb002/index', to: 'mb002#index', via: [:get]

	# match 'm001main/index', to: 'm001main#index', via: [:get, :post]
	# match 'm001main/getAjax', to: 'm001main#getAjax', via: [:post]

	# match 'm001tree/index', to: 'm001tree#index', via: [:get, :post]

	# match 'm001in/index', to: 'm001in#index', via: [:get, :post]

	# match 'pw_hin/index', to: 'pwhin#index', via: [:get, :post]



	# resources :user do
	#   resource :login, controller: 'user/login'
	# end
end
