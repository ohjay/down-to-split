Rails.application.routes.draw do

  resources :debts

  resources :expenses

  resources :purchases

  resources :products

  resources :shopping_trips

  resources :vendors

  devise_for :users
  resources :users

  root 'home#index'
  get 'about', to: 'home#about'
  get 'terms_of_service', to: 'home#terms_of_service'

end
