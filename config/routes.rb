Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#index"
  
  resources :pages

  resources :links

  resources :comments

  resources :votes

  resources :search

  resources :comment_votes
end
