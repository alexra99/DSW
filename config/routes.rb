Rails.application.routes.draw do

  root 'posts#index'

  
  
  resources :posts
  get "/about", to: "posts#about"
  resources :users
  get "/user", to: "posts#user"
  
end