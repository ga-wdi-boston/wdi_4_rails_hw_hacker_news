Rails.application.routes.draw do
  resources :articles, only: [:index, :show, :new] do
    resources :comments, only: [:new, :create, :destroy]
  end
  devise_for :users

  resources :users do
    resources :articles
  end


  root 'articles#index'
end
