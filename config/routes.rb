Rails.application.routes.draw do
  devise_for :users
  resources :users, only:[:index, :show, :edit, :update]
  root 'home#top'
  
  resources :notes
end
