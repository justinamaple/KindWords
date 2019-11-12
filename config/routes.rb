Rails.application.routes.draw do
  post '/login' => 'accounts#login'
  post '/create' => 'accounts#create'

  resources :seens, only: %i[index create]
  resources :letters, only: %i[index create show update] do
    resources :responses, only: %i[index create show]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
