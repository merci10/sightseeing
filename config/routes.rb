Rails.application.routes.draw do
  get 'map/index/:id' => 'map#index', as: 'map'

  devise_for :users
  root 'home#top'
  resources :users, only:[:index, :show, :edit, :update]
  resources :notes do
    collection do
      get 'search'
    end
    resources :comments, only: [:create]
  end
end
