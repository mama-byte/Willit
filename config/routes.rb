Rails.application.routes.draw do
  resources :users, only: [:update, :show, :edit]
  resources :valuables, only: [:index, :edit, :update, :create, :show, :new, :destroy]
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
=======
  get '/profile', to: "profiles#show", as: :profile
  get '/profile/edit', to: "profiles#edit", as: :profile_edit
  patch '/profile/update', to: "profiles#update", as: :profile_update
>>>>>>> master
end
