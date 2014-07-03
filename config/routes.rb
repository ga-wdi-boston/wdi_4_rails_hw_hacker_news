Rails.application.routes.draw do

  devise_for :users

resources :articles do
    resources :comments, only: [:new, :create]
    resources :upvotes, only: [:create, :destroy]
    resources :downvotes, only: [:create, :destroy]
  end

  root 'articles#index'

end
