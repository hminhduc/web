Jpt::Application.routes.draw do

  # get 'events/index'

  get 'joutaimasters/index'

  get 'bashomaster/index'

  resources :events, only: [:index, :new, :create, :edit, :update] do
		collection do
			post :change_user
		end
	end
	
  resources :kouteimasters

  # get "shozais/index"
  post "shozais/select"
	resources :shozais do
		collection do
			# post :getAjax
			get :main
		end
	end

	root to: 'users#login'

	# post 'users/login'

	# match 'login', to: 'users#create', via: [:post]
	# match 'change_pass', to: 'users#change_pass', via: [:get,:post]
	# match 'change_pass_exc', to: 'users#change_pass_exc', via: [:get,:post]

	match 'main', to: 'main#index', via: [:get]

	match 'tree', to: 'tree#index', via: [:get]
	match 'call_by_ajax', to: 'tree#getAjax', via: [:post]
	match 'uploadFile', to: 'tree#upload', via: [:get,:post]
	match 'email', to: 'tree#email', via: [:get,:post]
	match 'emailxhr', to: 'tree#emailxhr', via: [:post]
	match 'scroll', to: 'tree#scroll', via: [:get,:post]

	# match 'multiselect', to: 'tree#multiselect', via: [:get,:post]
	# match 'employer', to: 'tree#employer', via: [:get,:post]

	# resources :employers, only: [:index, :create, :new, :edit, :show, :update, :destroy]
  resources :users, only: [:create, :new] do
    collection do
      get :login
    end
  end
  resources :employers

end
