Rails.application.routes.draw do
 

  resources :companies
  resources :cargos
  resources :procesos
  devise_scope :user do 
    get "users/index", to: "users/views#index", as: "users_index"
    get "user/:id", to: "users/views#show_user", as: "show_user"
    get "user/:row/:tipo", to: "users/views#order_user", as: "order_user"
    post "create_user", to: "users/views#create_user", as: "create_user"
    get '/users/:id/edit', to: 'users/views#edit_user', as: "edit_user"
    get '/users/new', to: 'users/views#new_user', as: "new_user"
    post "/users/update_user/edit", to: "users/views#update_user", as: "update_user"
    delete "delete_user/:id", to: "users/views#delete_user", as: "delete_user"
   
  end
devise_for :users
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
