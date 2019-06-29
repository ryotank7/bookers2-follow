Rails.application.routes.draw do
  get 'home/about'
  devise_for :users
    resources :books do
    	resource :book_comments, only:[:create, :destroy]
    	resource :favorites, only:[:create, :destroy]
    end
  	resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to:'home_#index'
end

