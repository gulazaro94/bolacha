Rails.application.routes.draw do

  resources :categories

  resources :users, except: [:index]

  resources :user_sessions, only: [:new, :create, :destroy]

  get '/user_confirmation', to: 'useful#user_confirmation'

  root 'useful#index'

end
