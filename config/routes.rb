Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/profile', to: "profiles#show", as: :profile
  get '/profile/edit', to: "profiles#edit", as: :profile_edit
  patch '/profile/update', to: "profiles#update", as: :profile_update


end
