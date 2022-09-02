# frozen_string_literal: true

Rails.application.routes.draw do
  resources :admins, only: [:index]
  namespace :admin do
    resources :products
  end
  resource :carts, only: %i[show create]
  namespace :carts do
    resources :cart_products, only: %i[create destroy]
  end
  resources :products
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'welcome#index'
  get 'welcome/index'
  mount RailsAdmin::Engine => '/db_admin', as: 'rails_admin'
end
