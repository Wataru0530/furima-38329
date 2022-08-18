Rails.application.routes.draw do
  get 'furimas/index'
  devise_for :users
  resources :furimas, only: [:index, :new, :destroy, :create]
  root to: 'furimas#index'
 
end
