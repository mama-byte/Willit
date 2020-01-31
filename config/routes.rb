Rails.application.routes.draw do
  resources :users, only: [:update, :show, :edit]
  resources :valuables, only: [:index, :edit, :update, :create, :show, :new, :destroy]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
