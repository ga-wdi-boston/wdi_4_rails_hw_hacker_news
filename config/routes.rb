Rails.application.routes.draw do
  devise_for :users

  resources :articles do
    resources :comments, except: [:index, :destroy]
    resources :votes, except: :index
  end

  resources :comments, only: :show do
    resources :votes, except: :index
  end

  root 'articles#index'
end
