Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :friend_groups do
    resources :bookings, only: [:create]
    resources :reviews, only: [:create]
  end
  resources :dashboards, only: [:show]
  resources :bookings, only: [:show]
end
