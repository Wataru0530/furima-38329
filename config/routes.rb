Rails.application.routes.draw do
  devise_for :users
  resources :furimas, only: [:index, :new, :destroy]
  root to: 'furimas#index'
 
end
