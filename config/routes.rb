Rails.application.routes.draw do

  devise_for :users
  root 'articles#index'

  resources :articles do
    resources :comments #, defaults: {commentable: 'article'}
  end

  resources :votes

 # has_many :votes

end
