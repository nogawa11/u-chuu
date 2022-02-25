Rails.application.routes.draw do
  devise_for :users

  resources :users, only: %i[show edit update] do
    resources :user_reviews, only: %i[new create]
  end

  root to: 'pages#home'
  resources :reservations
  resources :planets
  resources :planets do
    resources :reviews, only: %i[new create]
    resources :reservations, only: %i[new create]
  end

  resources :reviews, only: :destroy
  namespace :owner do
    resources :planets, only: :index
    resources :reservations, only: :index
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
