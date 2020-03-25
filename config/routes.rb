Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  post '/homes/guest_sign_in', to: 'homes#new_guest'
end
