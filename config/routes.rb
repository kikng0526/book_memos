Rails.application.routes.draw do
  root to: "books#index"
  get 'search', to: 'books#search'
  devise_for :users
  resources :books do
    resources :comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
