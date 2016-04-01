Rails.application.routes.draw do
  root 'posts#index'
  resource :user, only: [:new, :create, :show] do
    resource :profile, only:[:show]
  end
  resource :session, only: [:new, :create, :destroy]
  resource :welcome, only: :show
  resources :posts do
    resources :comments, only: [:index, :new, :create, :show]
    resources :votes
  end

end
