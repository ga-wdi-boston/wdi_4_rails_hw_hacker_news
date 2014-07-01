Rails.application.routes.draw do
  devise_for :users

  resources :articles do
    resources :comments, only: [:new, :create] do
      resources :likes, only: [:create, :destroy]
    end
    resources :likes, only: [:create, :destroy]
  end

end
