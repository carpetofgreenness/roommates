Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  get 'pages/home'
  resources :houses
  resources :items
  resources :shares
  resources :memberships
  get 'pages/profile', to: 'pages#profile'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
