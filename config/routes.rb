Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # resources :orders, only: [:create, :update]
  resources :orders
  resources :users, only: [:show]
  root 'homes#index'
  post '/homes/guest_sign_in', to: 'homes#new_guest'
end
