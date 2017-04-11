Rails.application.routes.draw do
 

  root 'dashboard#index'   

resources :reports do 
    get :get_reportsc, on: :collection
    get :get_invitadoc, on: :collection
    get :get_asignadosc, on: :collection
    get :get_misreportsc, on: :collection
         

    resources :accions do 
        resources :aseguimientos
        resources :riesgos
        get :get_misaccionsc, on: :collection
    end
    resources :tasks do 
          get :get_tasksc, on: :collection
    end
    resources :causas
    resources :rseguimientos
    get "correcciones", to: "accions#correcciones" , as: "correcciones" 
end

get 'my_reports/index', as: "misreports"
get 'my_reports/asignados', to: "my_reports#asignado_por_mi", as: "reports_asignados"
get 'my_reports/invitado', to: "my_reports#invitado", as: "invitado"
get 'reports_calendar' , to: "my_reports#reports_calendar", as: "reports_calendar"
get 'reports/:id/seguimiento', to: "reports#seguimiento", as: "report_seguimientos"
get "reportes/abiertos", to: "reports#abiertos", as: "reports_abiertos"
get "reportes/cerrados", to: "reports#cerrados", as: "reports_cerrados"
delete "delete_reports", to: "reports#delete_reports", as: "delete_reports"
get 'set_contacts/:id', to: "reports#set_contacts", as: "set_contacts"
post 'change_state' , to: "reports#change_state", as: "change_state"









  get 'home/index'
  get 'my_tasks/index' , as: "mistasks"
  get 'my_tasks/asignados', to: "my_tasks#asignado_por_mi", as: "tasks_asignados"

  get 'asignados_d', to: 'dashboard#asignados_d', as: "asignados_d"
  get 'invitado_d', to: 'dashboard#invitado_d', as: "invitado_d"
  get 'employed_indicators', to: 'dashboard#employed_indicators', as: "employed_indicators"
  
  get 'amefps/show/:causa' , to: "amefps#show", as: "show_amefp"
  get 'new_amefp/:causa', to: 'causas#new_amefp', as: "new_amefp"

  #Analisis de Causas       
  get 'amefs/index' 
  get 'causa_efectos/create'
  get 'causa_efectos/udpate'
  get 'causa_efectos/destroy'
  post 'crear_amefp' , to: "causas#crear_amefp", as: "crear_amefp"
  get 'edit_amefp/:id' , to: "causas#edit_amefp", as: "edit_amefp"
  patch "update_amefp/:id", to: "causas#update_amefp", as: "update_amefp"

  resources :clinte_proveedors do
  collection { post :import }

end

  resources :contacts
  
  post "crear_caef", to: "causas#create_caef", as: "crear_caef"
  get 'new_caef/:causa/:m/:sub', to: 'causas#new_caef', as: "new_caef"
  get '/edit_caef/:id/edit', to: 'causas#edit_caef', as: "edit_caef"
  get '/show_caef/:id', to: 'causas#show_caef', as: "show_caef"
  patch "update_caef/:id", to: "causas#update_caef", as: "update_caef"
  delete "delete_caef/:id", to: "causas#destroy_caef", as: "delete_caef"
  post "update_vcaef", to: "causas#update_vcaef", as: "update_vcaef"


  resources :rols
  get 'my_accions/index', as: "misacciones"
   get 'my_accions/asignados', to: "my_accions#asignado_por_mi", as: "accions_asignados"
    get 'my_accions/invitado', to: "my_accions#invitado", as: "accions_invitado"
  
  get 'accions_calendar' , to: "my_accions#accions_calendar", as: "accions_calendar"
  get 'tasks_calendar' , to: "my_tasks#tasks_calendar", as: "tasks_calendar"
  get 'set_cargos/:id', to: "cargos#set_cargos", as: "set_cargos"
  
  
  

          resources :tipos
          #resources :accions
          resources :sources
       
            
          
          
          get "normass/:id", to: "reports#get_normas", as: "get_normas"
          get "sourcee/:id", to: "reports#get_sourcee", as: "get_sourcee"
          get "source1/:id/:page/:search", to: "sources#change", as: "change"
          delete "delete_procesos", to: "procesos#delete_procesos", as: "delete_procesos"
         
          delete "delete_cargos", to: "cargos#delete_cargos", as: "delete_cargos"
          post "cerrar_report", to: "reports#cerrar_report", as: "cerrar_report"
          resources :normas do 
                resources :numerals
                

          end
          resources :employeds do
  collection { post :import }

end
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
            delete "delete_users", to: "users/views#delete_users", as: "delete_users"
            delete "delete_employeds", to: "employeds#delete_employeds", as: "delete_employeds"
            delete "delete_clientes", to: "clinte_proveedors#delete_clientes", as: "delete_clientes"
            delete "delete_normas", to: "normas#delete_normas", as: "delete_normas"
            delete "delete_numerals/:norma_id", to: "numerals#delete_numerals", as: "delete_numerals"
            delete "delete_roles", to: "rols#delete_roles", as: "delete_roles"
            delete "delete_sources", to: "sources#delete_sources", as: "delete_sources"
            
          end
        devise_for :users
          
          match "*path" => redirect("/"), via: :get 
          # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
