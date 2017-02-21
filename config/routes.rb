Rails.application.routes.draw do

  get '/users/new' => 'users#signup', as: :signup

  root 'users#welcome'


end
