Rails.application.routes.draw do
  post '/login' => 'accounts#login'
  post '/signup' => 'accounts#create'
  get '/accounts/:id/unseen' => 'accounts#unseen'

  resources :letters, only: [:index, :create] do
    resources :responses, only: [:index, :create, :show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
