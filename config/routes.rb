Rails.application.routes.draw do


  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#pages_requires_login'
  
  #root 'posts#index'

  
  
  resources :posts
  get "/about", to: "posts#about"
  resources :users
  get "/user", to: "posts#user"
  
end