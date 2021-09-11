Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard', to: "dashboard#index"
    #user
    get 'users', to: "manage_user#show_users"
    get 'new_user', to: "manage_user#new_user"
    post 'create_user', to: "manage_user#create_user"
  end
  root to: 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
