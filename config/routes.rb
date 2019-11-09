Rails.application.routes.draw do
  
  post '/login' => 'accounts#login'
  post '/signup' => 'accounts#create'

  resources :letters, only: [:index, :create, :show] do
     resources :responses, only: [:index, :create, :show]
  end 

  # get '/letters' => 'letters#index'
  # get '/letters/:id' => 'letters#show'
  # post '/letters' => 'letters#create'
  
  # get '/responses/:id' => 'responses#letter'
  # get '/responses/:id' => 'responses#show'
  # post '/responses' => 'responses#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end