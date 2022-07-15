# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
    post '/users/:id/posts/new', to: 'posts#create' # create
    post '/posts/:id/comment', to: 'posts#comment', as: :comments
    post '/posts/:id/like', to: 'posts#like', as: :like
  end
end
