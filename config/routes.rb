Rails.application.routes.draw do
  resources :responses
  post '/login' => 'accounts#login'
  post '/signup' => 'accounts#create'
  resources :letters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
