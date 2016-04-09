Rails.application.routes.draw do
  root 'posts#index'
  resource :user, only: [:new, :create, :show] do
    resource :profile, only: [:show]
  end
  resource :session, only: [:new, :create, :destroy]
  resource :welcome, only: :show
  resources :posts do
    resources :comments, only: [:index, :new, :create, :show]
    resources :votes
    resource :tender, only: [:show, :create] do
      resources :members, only: [:index, :new, :create]
      resources :tender_votes do
      end
    end
  end
  post '/posts/:post_id/tender/tender_votes', to: 'tender_votes#create', as: 'tender_tender_votes'
end
