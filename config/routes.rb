Rails.application.routes.draw do
  resources :attractions
  resources :users
  root 'users#new'
  get 'signin', to: 'users#signin'
  post 'login', to: 'users#login'
  get 'logout', to: 'users#logout'
  post 'ride/:id', to: 'rides#ride'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
