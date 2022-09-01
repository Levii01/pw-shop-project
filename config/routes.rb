# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :products
  end
  resource :carts, only: [:show]
  namespace :carts do
    resources :cart_products, only: [:create]
  end
  resources :products
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'welcome#index'
  get 'welcome/index'
end
