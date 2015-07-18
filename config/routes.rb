Rails.application.routes.draw do

  devise_for :users

  resources :articles do
    resources :points, only: [:create, :destroy]
    # this line gives points to the articles

    resources :comments do
      resources :points, only: [:create, :destroy]
      # this is a third tier nested resource since points is nested under comments
    end
  end

  root 'articles#index'
end
