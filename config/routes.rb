Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  resources :books,only: [:index,:edit,:create,:update,:destroy,:show] do
    resources :book_comments,only: [:create,:destroy]
    resource :favorites, only: [:create,:destroy]
  end

  get 'home/about' => 'homes#about'
  resources :users,only: [:show,:index,:edit,:update]
end