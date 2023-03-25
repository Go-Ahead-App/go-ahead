# frozen_string_literal: true

# Routes for the application
Rails.application.routes.draw do
  resources :progresses
  resources :exercises
  resources :activities
  resources :events
  resources :enrolled_programs
  resources :actions
  resources :challenges
  resources :programs

  devise_for :users

  resources :users

  resources :boards do
    resources :notes do
      resources :categories, only: %i[create destroy] do
        member do
          post 'assign'
        end
      end
    end
  end

  root 'static_pages#home'
end
