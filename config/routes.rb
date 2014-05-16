Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'

  resources :articles do
    resources :votes, defaults: {voteable: 'article'}
  end

  resources :comments do
    resources :votes, defaults: {voteable: 'comment'}
  end
end
