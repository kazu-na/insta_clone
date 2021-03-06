Rails.application.routes.draw do

  root 'static_pages#top'
  get    '/privacy',                    to: 'static_pages#privacy'
  get    '/signup',                     to: 'users#new'
  post   '/signup',                     to: 'users#create'
  get    '/login',                      to: 'sessions#new'
  post   '/login',                      to: 'sessions#create'
  delete '/logout',                     to: 'sessions#destroy'
  get    '/auth/facebook/callback',     to: 'users#create',          as: :auth_callback
  get    '/auth/failure',               to: 'users#auth_failure',    as: :auth_failure

  resources :users do
    member do
      get :edit_pass, :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:new, :show, :create, :destroy] do
    resources :comments
  end
  resources :relationships,       only: [:create, :destroy]
end
