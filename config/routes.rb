Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "sessions#new"

  resources :users, only: [:new, :create, :show] do
    resources :favorites, only: [:index]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :categories do
      resources :gifs
    end
  end

  resources :gifs, only: [:index, :show]
end
