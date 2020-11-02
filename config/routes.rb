Rails.application.routes.draw do
  # resources :tweets
  devise_for :users
  root 'tweets#index'

  get "retweet", to: "tweets#retweet", as: :retweet
  get "list", to: "users#index", as: :user_tweets

  resources :tweets do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
