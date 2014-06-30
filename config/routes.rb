Rails.application.routes.draw do
  devise_for :users

  resources :articles
end

# Create views, to enable login, to complete step 1
