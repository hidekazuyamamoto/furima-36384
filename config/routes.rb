Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :purchaseds, only: [:index, :create]
    collection do
      get 'search'
    end
  end
  root to:'items#index'
end
