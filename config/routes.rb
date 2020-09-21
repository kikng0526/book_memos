Rails.application.routes.draw do
  root to: "books#index"
  get 'search', to: 'books#search'
  # post   '/like/:comment_id' => 'likes#like',   as: 'like'
  # delete '/like/:comment_id' => 'likes#unlike', as: 'unlike'
  devise_for :users

  resources :books do
    resources :comments, only: [:create, :destroy] 
  end

  resources :comments do
    resources :likes
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
