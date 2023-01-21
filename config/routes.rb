Rails.application.routes.draw do
  get 'books/top'
  devise_for :users
  # get 'homes/top'
  root :to => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books
end