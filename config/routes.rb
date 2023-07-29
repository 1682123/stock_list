Rails.application.routes.draw do
  root to: 'tops#index'
  resources :top, only: :index
end
