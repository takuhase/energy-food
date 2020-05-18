Rails.application.routes.draw do
  # devise_for :shop_clerks

  devise_for :shop_clerks, controllers: {
  sessions: 'shop_clerks/sessions',
  passwords: 'shop_clerks/passwords',
  registrations: 'shop_clerks/registrations'
  }




  resources :likes, only: [:create, :destroy]
  devise_for :users

  resources :orders
  resources :users, only: [:show]
  root 'homes#index'
  post '/homes/guest_sign_in', to: 'homes#new_guest'
end
