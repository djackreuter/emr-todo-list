Rails.application.routes.draw do
  root 'lists#index'
  resources :lists do
    resources :tasks
  end
  resources :users
  resources :albums, only: [:index]
  resources :documents, only: [:index, :show, :create, :destroy]
end
