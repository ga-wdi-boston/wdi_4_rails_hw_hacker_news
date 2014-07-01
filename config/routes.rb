Rails.application.routes.draw do

  devise_for :users
  resources :articles, only: [:index, :show, :new, :create] do
    resources :comments, only: [:new, :create]
  end
  root 'articles#index'

end
