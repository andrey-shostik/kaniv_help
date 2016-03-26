Rails.application.routes.draw do
  root 'posts#index'
  resource :user, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resource :welcome, only: :show
  resources :posts do
    resources :comments, only: [:index, :new, :create, :show]
  end
end
