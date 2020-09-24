Rails.application.routes.draw do
  get 'users/show'
  root to: "books#index"
  get 'search', to: 'books#search'
  devise_for :users
  resources :users, :only => [:show]

  resources :books do
    resources :comments, only: [:create, :destroy] 
  end

  resources :comments do
    resources :likes
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
