Rails.application.routes.draw do
  root 'home#top'
  
  resources :notes
end
