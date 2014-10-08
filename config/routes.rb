Rails.application.routes.draw do

  resources :categories

  resources :users, except: [:index]

  resources :user_sessions, only: [:new, :create]

  delete '/user_sessions', to: 'user_sessions#destroy'

  get '/user_confirmation', to: 'useful#user_confirmation'

  root 'users#index'

end
