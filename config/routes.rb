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

	root to: 'users#login'
	post 'users/login'

	match 'login', to: 'users#create', via: [:post]
	match 'change_pass', to: 'users#change_pass', via: [:get,:post]
	match 'change_pass_exc', to: 'users#change_pass_exc', via: [:get,:post]

end
