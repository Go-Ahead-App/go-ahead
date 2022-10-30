# frozen_string_literal: true

# Routes for the application
Rails.application.routes.draw do
  devise_for :users

  resources :users

  resources :boards do
    resources :notes
  end

  root 'static_pages#home'
end
