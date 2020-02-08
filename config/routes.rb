Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'pages/dashboard', to: 'pages#dashboard', as: :dashboard
  get '/profile', to: "profiles#show", as: :profile
  get '/profile/edit', to: "profiles#edit", as: :profile_edit
  patch '/profile/update', to: "profiles#update", as: :profile_update
  resources :valuables, only: [:index, :edit, :update, :create, :show, :destroy]
  get '/valuables/new/:category/:item', to: 'valuables#new', as: :new_valuable
  get '/valuables/category/:category', to: "valuables#items", as: :valuable_items
  get '/valuables/:id', to: "valuables#show", as: :valuable_show
  get '/valuables/:id', to: "valuables#edit", as: :valuable_edit
  resources :ceremonies
  resources :contacts
end
