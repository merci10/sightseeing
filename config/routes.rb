Rails.application.routes.draw do
  resources :users
  root 'home#top'
  
  resources :notes
end
