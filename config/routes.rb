Rails.application.routes.draw do
  devise_for :users

  resources :articles do
    resources :comments, except: :destroy
    resources :votes, except: [:index, :show, :destroy]
  end

  resources :comments, only: :show do
    resources :votes, except: [:index, :show, :destroy]
  end

  get 'users/:user_id', to: 'authors#show', as: 'author'

  root 'articles#index'
end
