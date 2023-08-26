Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#index'
  resources :tops, only: :index
  resources :stocks, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  end
  resources :memos, only: [:index, :new, :create, :edit, :update, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
