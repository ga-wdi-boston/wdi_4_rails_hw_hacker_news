Rails.application.routes.draw do

  devise_for :users

  resources :articles
  resources :comments

  root 'articles#index'

end
