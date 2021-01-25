Rails.application.routes.draw do

  root to: 'main#home', as: 'home'

  resources :users do
      resources :comments, only: [:index]
    resources :photos, only: [:new, :edit, :show, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
  end

  post 'photos', to: 'photos#create'
  get 'photos', to: 'photos#index'

  get 'signup', to: 'users#new'

  get '/auth/facebook/callback' => 'sessions#facebook'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#destroy'


end
