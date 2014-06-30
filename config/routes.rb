Rails.application.routes.draw do

  devise_for :users
  resources :articles, only: [:index, :show, :new, :create]
  root 'articles#index'

end
