Rails.application.routes.draw do
  root 'posts#index'
  resource :user, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :posts
end
