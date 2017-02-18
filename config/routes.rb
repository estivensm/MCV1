Rails.application.routes.draw do
 

          

  
         
  get 'causa_efectos/create'

  get 'causa_efectos/udpate'

  get 'causa_efectos/destroy'

  resources :clinte_proveedors
  resources :contacts
  get 'my_reports/index', as: "misreports"
  post "crear_caef", to: "causa_efectos#create", as: "crear_caef"

  resources :rols
  get 'my_accions/index', as: "misacciones"
  get 'my_reports/asignados', to: "my_reports#asignado_por_mi", as: "reports_asignados"
  get 'set_cargos/:id', to: "cargos#set_cargos", as: "set_cargos"
  get 'set_contacts/:id', to: "reports#set_contacts", as: "set_contacts"
  get 'reports/:id/seguimiento', to: "reports#seguimiento", as: "report_seguimientos"
  

          resources :tipos
          resources :accions
          resources :sources
          resources :reports do 
            resources :accions do 
                resources :aseguimientos
            end
            resources :causas
            resources :rseguimientos
            get "correcciones", to: "accions#correcciones" , as: "correcciones" 
          end
            
          
          get "reportes/abiertos", to: "reports#abiertos", as: "reports_abiertos"
          get "reportes/cerrados", to: "reports#cerrados", as: "reports_cerrados"
          get "normass/:id", to: "reports#get_normas", as: "get_normas"
          get "sourcee/:id", to: "reports#get_sourcee", as: "get_sourcee"
          get "source1/:id/:page/:search", to: "sources#change", as: "change"
          delete "delete_procesos", to: "procesos#delete_procesos", as: "delete_procesos"
          delete "delete_reports", to: "reports#delete_reports", as: "delete_reports"
          post "cerrar_report", to: "reports#cerrar_report", as: "cerrar_report"
          resources :normas do 
                resources :numerals
                

          end
          resources :employeds
          resources :companies #, only: [:show, :create, :edit, :update, :index]
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

          match "*path" => redirect("/"), via: :get 
          # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
