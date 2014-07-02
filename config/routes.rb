Rails.application.routes.draw do
  resources :articles do
    resources :comments do
      resources :votes, only: [:create, :update, :destroy]
    end
    resources :votes, only: [:create, :update, :destroy]
  end

  devise_for :users

  root 'articles#index'
end
