# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resource :ping, only: [:show]

      namespace :administration do
        resources :users, only: %i[create destroy]
      end
    end
  end
end
