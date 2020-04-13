Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root 'homes#index'
  post '/homes/guest_sign_in', to: 'homes#new_guest'
end
