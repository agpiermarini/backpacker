Rails.application.routes.draw do
  root controller: 'welcome', action: :index

  resources :users, only: [:new, :create, :show]
end
