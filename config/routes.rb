Rails.application.routes.draw do

  get 'users/new'
  get 'users/create'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'authorized', to: 'sessions#pages_requires_login'
  
  root 'sessions#new'
  
  resources :posts
  get "/about", to: "posts#about"
  resources :users do
    resources :posts
  end
  
end