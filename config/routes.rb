Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items do
    resources :purchases, only: :index
    member do
      get 'index'
    end
  end
end
