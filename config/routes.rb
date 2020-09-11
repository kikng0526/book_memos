Rails.application.routes.draw do
  get 'books/index'
  root to: "books#index"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
