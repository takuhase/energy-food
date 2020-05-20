Rails.application.routes.draw do
  namespace :shop_clerks do
    # get 'homes/index'
    root 'homes#index'
    resources :foods
    resources :daily_foods
  end

  devise_for :shop_clerks, controllers: {
    sessions: 'shop_clerks/sessions',
    passwords: 'shop_clerks/passwords',
    registrations: 'shop_clerks/registrations',
  }
  devise_for :users
  resources :likes, only: [:create, :destroy]
  resources :orders
  resources :users, only: [:show]
  root 'homes#index'
  post '/homes/guest_sign_in', to: 'homes#new_guest'
end
