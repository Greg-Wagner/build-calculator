Rails.application.routes.draw do
  resources :sessions
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :outputs
  resources :price_data

  root to: 'outputs#welcome', as: :welcome

  resources :users, only: [:new, :show, :index, :create]
  post '/outputs/create_image', to: 'outputs#create_image'
  get '/image_test', to: 'outputs#image_test'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

end
