Rails.application.routes.draw do

  root 'articles#index'

  devise_for :users
  resources :articles do
    resources :comments
    resources :votes, defaults: {voteable: 'article'}
  end

  resources :comments do
    resources :votes, defaults: {voteable: 'comment'}
  end

end
