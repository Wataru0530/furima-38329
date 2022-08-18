Rails.application.routes.draw do
  
  devise_for :users
  resources :furimas, only: [:index, :new, :destroy, :create]
  root to: 'furimas#index'
 
end
