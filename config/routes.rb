Rails.application.routes.draw do

  get '/items/bolacha/new', to: 'items#new_bolacha', as: 'new_bolacha'

  get '/items/rotulo/new', to: 'items#new_rotulo', as: 'new_rotulo'

  resources :items, except: [:new]

  resources :categories

  resources :users, except: [:index]

  resources :user_sessions, only: [:new, :create]

  delete '/user_sessions', to: 'user_sessions#destroy'

  get '/user_confirmation', to: 'useful#user_confirmation'

  root 'useful#index'

end