Rails.application.routes.draw do
  resources :articles do
    resources :comments
  end

  devise_for :users

  root 'articles#index'
end
