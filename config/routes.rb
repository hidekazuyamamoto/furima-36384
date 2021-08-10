Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :purchaseds
  end
  root to:'items#index'
end
