Rails.application.routes.draw do
  devise_for :users
  resources :items do
    resources :purchased
  end
  root to:'items#index'
end
