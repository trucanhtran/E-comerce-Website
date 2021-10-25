Rails.application.routes.draw do
  namespace :admin do
    get 'dashboard', to: "dashboard#index"
    #user
    get 'users', to: "manage_user#show_users"
    get 'new_user', to: "manage_user#new_user"
    post 'create_user', to: "manage_user#create_user"
    get 'edit_user/:id', to: "manage_user#edit_user", as: "edit_user"
    patch 'update_user/:id', to: "manage_user#update_user", as: "update_user"
    delete 'delete_user/:id', to: "manage_user#delete_user", as: "delete_user"
     #product
     get 'products', to: "manage_product#show_products"
     get 'new_product', to: "manage_product#new_product"
     post 'create_product', to: "manage_product#create_product"
     get 'edit_product/:id', to: "manage_product#edit_product", as: "edit_product"
     patch 'update_product/:id', to: "manage_product#update_product", as: "update_product"
     delete 'delete_product/:id', to: "manage_product#delete_product", as: "delete_product"
     get 'show_product/:id', to: "manage_product#show_product", as: "show_product"
     #category
     get 'categories', to: "manage_category#show_categories"
     get 'new_category', to: "manage_category#new_category"
     post 'create_category', to: "manage_category#create_category"
     get 'edit_category/:id', to: "manage_category#edit_category", as: "edit_category"
     patch 'update_category/:id', to: "manage_category#update_category", as: "update_category"
     delete 'delete_category/:id', to: "manage_category#delete_category", as: "delete_category"
  end
  root to: 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
