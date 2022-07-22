# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  post '/login', to: 'authentication#login', default: {:format => :json}
  post '/signup', to: 'authentication#signup', default: {:format => :json}

  namespace 'api' do
    namespace 'v1' do
      get 'users/:user_id/posts' => 'api#user_posts'
      get 'users/:user_id/posts/:post_id' => 'api#user_comments'
      post 'posts/:post_id/comment' => 'api#add_comment_to_post'
    end
  end
  devise_scope :user do
    # Redirects signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'users#index'
  resources :users, only: [:index, :show, :new, :create, :destroy] do
    resources :posts do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
end
