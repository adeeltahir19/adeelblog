Rails.application.routes.draw do
  
  get 'categories/index'

  get 'categories/edit'

  get 'categories/new'

  get 'categories/show'

	get 'home/index'

	root 'home#index'
	
	resources :posts
	resources :categories

  
end
