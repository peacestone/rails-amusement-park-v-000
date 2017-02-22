Rails.application.routes.draw do


  root 'users#welcome'

  resources :users

  get '/signin' => 'users#new_session', as: :new_session

  post '/signin' => 'users#create_session', as: :create_session

  delete '/signout' => 'users#destroy_session', as: :destroy_session

  resources :attractions



end
