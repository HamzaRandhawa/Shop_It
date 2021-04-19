Rails.application.routes.draw do
  # get 'landing/index'
  root 'pages#home'

  get 'about', to: 'pages#about'

  get 'signup', to: 'users#new'
  
  resources :users, except: [:new]
  resources :products
  resources :categories

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'chat', to: 'chats#index'
  post 'message', to: "messages#create"

  mount ActionCable.server, at: '/cable'

  get 'landing/index'

  resources :carts
  resources :items

  post '/add_to_cart/:product_id', to: 'carts#add_to_cart'


end
