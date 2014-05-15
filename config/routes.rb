Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'

  resources :articles do
    resources :comments
    resources :votes, defaults: {votable: 'article'}
  end

end
