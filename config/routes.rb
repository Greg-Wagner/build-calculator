Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :outputs
  resources :price_data

  root to: 'outputs#welcome', as: :welcome

  post '/outputs/create_image', to: 'outputs#create_image'
  get '/image_test', to: 'outputs#image_test'

end
