Rails.application.routes.draw do

  devise_for :users

  resources :articles, only: [:index, :show, :new, :create] do
    resources :comments, only: [:create, :destroy]
    resources :votes, only: [:create, :destroy]
  end


  root 'articles#index'

end
