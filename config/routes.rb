# frozen_string_literal: true

Rails.application.routes.draw do
  resources :carts
  resources :products
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'welcome#index'
  get 'welcome/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
