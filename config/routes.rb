Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard', to: "dashboard#index"
    #user
    get 'new_user', to: "manage_user#new_user"
  end
  root to: 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
