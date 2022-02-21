Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :reservations
  resources :planets
  resources :planets do
    resources :reviews, only: [:new, :create]
  end
  namespace :owner do
    resources :planets, only: :index
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
