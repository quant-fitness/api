# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  use_doorkeeper
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :mes
      resource :ping, only: [:show]

      namespace :administration do
        resources :users, only: %i[create destroy index]
      end
    end
  end
end
