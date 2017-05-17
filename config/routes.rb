Rails.application.routes.draw do
  get 'map/index/:id' => 'map#index', as: 'map'
  post 'like/:note_id' => 'likes#like', as: 'like'
  delete 'unlike/:note_id' => 'likes#unlike', as: 'unlike'

  devise_for :users
  root 'home#top'
  resources :users, only:[:index, :show, :edit, :update] do
    member do
      get :like_notes
    end
  end
    
  resources :notes do
    collection do
      get 'search'
    end
    resources :comments, only: [:create]
  end
end
