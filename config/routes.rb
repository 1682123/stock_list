Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :tops, only: :index
  resources :stocks, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :memos, only: :index
end
