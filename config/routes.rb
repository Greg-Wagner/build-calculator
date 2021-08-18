Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :outputs
  resources :price_data
  resources :application_helper

  post '/outputs/create_image', to: 'outputs#create_image'

end
