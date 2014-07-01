Rails.application.routes.draw do

  resources :articles, :comments
  devise_for :users
end
