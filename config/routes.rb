Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'

  resources :articles do
    resources :comments do
      resources :votes, defaults: {votable: 'comment'}
    end
    resources :votes, defaults: {votable: 'article'}
  end

end
