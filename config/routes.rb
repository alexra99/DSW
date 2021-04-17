Rails.application.routes.draw do

  get 'users/new'
  get 'users/create'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/welcome'
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