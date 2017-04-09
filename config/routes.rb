Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "sessions#new"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show] do
    resources :favorites, except: [:update]
  end

  # resources :gifs, only: [:index]

  namespace :admin do
    resources :categories, only: [:new, :create, :destroy]
  end

  resources :categories, only: [:index, :show]

  resources :gifs, only: [:new, :create]
  # do #[:put]
  #   put :favorite, on: :member
  # end

end
