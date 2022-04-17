Rails.application.routes.draw do
  # get '/users', to: 'users#index'
  resources :users, only: [:new, :create, :show]
end
