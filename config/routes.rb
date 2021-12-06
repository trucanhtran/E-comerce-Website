Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  namespace :api do
    get 'products', to: 'product#show_products'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
