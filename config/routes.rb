Rails.application.routes.draw do
  devise_for :users

  resources :articles do
    resources :comments, except: [:edit, :update, :destroy]
    resources :votes, only: [:create, :update, :destroy]
  end

  resources :comments, only: :show do
    resources :votes, only: [:create, :update, :destroy]
  end

  get 'newest', to: 'articles#newest', as: 'newest_articles'
  get 'newcomments', to: 'comments#new_comments', as: 'newest_comments'
  get 'users/:user_id', to: 'authors#show', as: 'author'

  root 'articles#index'
end
