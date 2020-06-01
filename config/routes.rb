Rails.application.routes.draw do
  devise_for :users
  root 'genres#index'
  resources :users, only: [:edit, :update]
  resources :genres, only: [:new, :create, :edit, :update] do
    resources :posts, only: [:index, :create]
  end
end