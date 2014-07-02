Rails.application.routes.draw do

  devise_for :users

  resources :articles, only:[:index, :show, :new, :create, :destroy] do
    resources :comments, only:[:index,:new,:create]
    resources :votes, only:[:create,:destroy]
  end

  resources :comments, only:[:index] do
    resources :votes, only:[:create,:destroy]
  end

  root 'articles#index'

end
