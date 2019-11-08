Rails.application.routes.draw do
  
  post '/login' => 'accounts#login'
  post '/signup' => 'accounts#create'
  get '/letters' => 'letters#index'
  get '/letters/:id' => 'letters#show'
  post '/letters' => 'letters#create'
  get '/responses/:id' => 'responses#letter'
  get '/response/:id' => 'responses#show'
  post '/responses' => 'responses#create'
  #hi from brian
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
