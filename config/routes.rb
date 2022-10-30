# frozen_string_literal: true

# Routes for the application
Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#home'
end
