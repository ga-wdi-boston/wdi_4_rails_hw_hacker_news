Rails.application.routes.draw do

  devise_for :users

  resources :articles do
    resources :comments, only: [:new, :create, :destroy]
    resources :votes, only:[:create, :destroy]
  end


  root 'articles#index'
end
