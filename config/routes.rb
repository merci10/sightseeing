Rails.application.routes.draw do
  devise_for :users
  resources :users
  root 'home#top'
  
  resources :notes
end
