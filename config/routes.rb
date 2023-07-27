# frozen_string_literal: true

# Routes for the application
Rails.application.routes.draw do
  namespace :admin do
    resources :actions
    resources :activities
    resources :boards
    resources :categories
    resources :challenges
    resources :enrolled_programs
    resources :events
    resources :exercises
    resources :invites
    resources :notes
    resources :programs
    resources :progresses
    resources :users

    root to: 'users#index'
  end

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

  namespace :api do
    namespace :v1 do
      resources :programs, only: %i[update] do
      end

      resources :challenges, only: %i[create update] do
      end
    end
  end

  root 'static_pages#home'
end
