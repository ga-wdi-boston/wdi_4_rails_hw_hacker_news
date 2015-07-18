Rails.application.routes.draw do
  resources :articles, only: [:index, :show, :new] do
    resources :comments, only: [:new, :create, :destroy]
    resources :likes, only: [:create, :update, :destroy]
  end
  devise_for :users

  resources :users, only: [] do
    resources :articles
  end

  resources :comments, only: [] do
    resources :likes, only: [:create, :update, :destroy]
  end


  root 'articles#index'
end
