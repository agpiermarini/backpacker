Rails.application.routes.draw do
  root controller: 'welcome', action: :index

  resources :user, only: [:new, :create, :show]
end
