Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :purchaseds, only: [:index, :create]
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search_name'
      get 'search_category'
    end
  end
  
  root to:'items#index'
end
