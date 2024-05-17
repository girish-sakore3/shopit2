Rails.application.routes.draw do
  resources :carts
  resources :cart_items
  namespace :category do
    resources :categories
  end
  resources :products
  resources :users
  # resources :auth
  post 'user/login', to: 'auth#login'
  post 'user/register', to: 'users#create'
  # post '/login', to: 'users#logn'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
