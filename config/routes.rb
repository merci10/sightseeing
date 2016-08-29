Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  resources :users, only:[:index, :show, :edit, :update]
  resources :notes do
    resources :comments, only: [:create]
  end
end
