Rails.application.routes.draw do
  get 'password/reset', to:'password_resets#new', as: :reset_password
  post 'password/reset', to:'password_resets#create'
  
  get 'password/reset/edit', to:'password_resets#edit', as: :edit_reset_password
  patch 'password/reset/edit', to:'password_resets#update'
  
  get 'password', to: 'passwords#edit', as: :edit_password
  patch 'password', to: 'passwords#update'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # get '/resgister', to: 'registration#index', as: :user_registration
  # get '/resgister/create', to: 'registration#create', as: :user_registration_create
  resources :users, as: :users

  root to: 'home#index' 

  get '/about-us', to: 'about#index' , as: :about # prefix
  # URI Pattern   , Controller_name#function(action)

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
 