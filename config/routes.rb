Rails.application.routes.draw do

  devise_for :users

  resources :articles, only: [:index, :new, :create] do
    resources :comments, only: [:index, :create]
    resources :votes, only: [:create, :destroy]
  end

  resources :comments, only: [] do
    resources :votes, only: [:create, :destroy]
  end

  root 'articles#index'

end
