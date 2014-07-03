Rails.application.routes.draw do

  devise_for :users

  resources :articles do
    resources :comments
    resources :votes, only: [:create, :destroy, :update]
  end

  resources :comments do
    resources :votes, only: [:create, :destroy, :update]
  end

  root 'home#show'

end
