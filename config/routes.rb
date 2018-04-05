Rails.application.routes.draw do
  root controller: 'welcome', action: :index

  resources :users, only: [:new, :create, :show]

  get   '/login',  to: 'sessions#new'
  post  '/login',  to: 'sessions#create'
  get   '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :countries, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :images, only: [:new, :create, :index, :edit, :update, :destroy]
    resources :users, only: [:index, :edit, :update, :destroy]
  end

  resources :destinations do
    resources :images, only: [:new, :create, :index, :destroy]
  end
end
