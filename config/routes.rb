Rails.application.routes.draw do
  devise_for :users

  resources :articles, only: [:show, :new, :create] do
    resources :comments, only: [:new, :create]
    resources :votes, only: [:create, :destroy]
  end

  root 'home#show'
end
