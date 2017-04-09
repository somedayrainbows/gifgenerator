Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "sessions#new"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show] do
    resources :favorites, only: [:new, :index, :create, :destroy]
  end
  resources :gifs, only: [:index]

  namespace :admin do
    resources :categories do
      resources :gifs, only: [:new, :create]
    end
  end

end
