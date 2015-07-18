Rails.application.routes.draw do


  devise_for :users do
    #/users/:user_id/article_manager
    get '/article_manager' => 'users#article_manager'
  end

  root to: 'articles#index'

  resources :articles do
    resources :comments, only: [:index, :new, :create] do
      resources :votes, only: [:create, :destroy]
    end
    resources :votes, only: [:create, :destroy]
  end

end
