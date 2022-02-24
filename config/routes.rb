Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show, :edit, :update] do
    resources :user_reviews, only: [:new, :create]
  end

  root to: 'pages#home'
  resources :reservations
  resources :planets
  resources :planets do
    resources :reviews, only: [:new, :create]
    resources :reservations, only: [:new, :create]
  end
  namespace :owner do
    resources :planets, only: :index
    resources :reservations, only: :index
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
