Rails.application.routes.draw do
  resources :articles, only: [:index, :new, :create] do
    resources :comments, only: [:index, :new, :create] do
      resources :votes, only: [:create, :update, :destroy]
    end
    resources :votes, only: [:create, :update, :destroy]
  end

  devise_for :users

  root 'articles#index'
end
