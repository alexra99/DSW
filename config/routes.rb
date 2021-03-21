Rails.application.routes.draw do

  root 'posts#index'

  
  
  resources :posts
  get "/about", to: "posts#about"
end