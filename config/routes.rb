Rails.application.routes.draw do

  devise_for :users
  resources :articles do
    resources :comments
    root 'articles#index'
  end
end
