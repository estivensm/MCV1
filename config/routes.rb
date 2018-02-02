Rails.application.routes.draw do
 

  

  resources :page_documents
  resources :source_parents
resources :reports do 
    get :get_reportsc, on: :collection
    get :get_invitadoc, on: :collection
    get :get_asignadosc, on: :collection
    get :get_misreportsc, on: :collection
    get :get_reportodos, on: :collection
        get :get_acciontodosi, on: :collection 
         get :get_tasktodos, on: :collection 

    resources :accions do 
        resources :aseguimientos
        resources :riesgos
        get :get_misaccionsc, on: :collection
        get :get_acciontodos, on: :collection
        resources :tasks do 
          get :get_tasksc, on: :collection
        end

    end
    
    resources :causas
    resources :rseguimientos
    get "correcciones", to: "accions#correcciones" , as: "correcciones"
    get "actividades", to: "accions#actividades" , as: "actividades" 
end

get 'my_reports/index', as: "misreports"
get 'my_reports/mis_reports_cerrados', to: "my_reports#mis_reports_cerrados", as: "mis_reports_cerrados"

get 'my_reports/asignados', to: "my_reports#asignado_por_mi", as: "reports_asignados"
get 'my_reports/asignados_cerrados', to: "my_reports#asignados_cerrados", as: "asignados_cerrados"



get 'my_reports/invitado', to: "my_reports#invitado", as: "invitado"
get 'reportst_calendar' , to: "reports#reportst_calendar", as: "reportst_calendar"
get 'reports_calendar' , to: "my_reports#reports_calendar", as: "reports_calendar"
get 'reports/:id/seguimiento', to: "reports#seguimiento", as: "report_seguimientos"
get "reportes/abiertos", to: "reports#abiertos", as: "reports_abiertos"
get "reportes/cerrados", to: "reports#cerrados", as: "reports_cerrados"
delete "delete_reports", to: "reports#delete_reports", as: "delete_reports"
get 'set_contacts/:id', to: "reports#set_contacts", as: "set_contacts"
get 'set_source_parents/:id', to: "reports#set_source_parents", as: "set_source_parents"
post 'change_state' , to: "reports#change_state", as: "change_state"
get 'show_info/:id' ,to: "reports#show_info", as: "show_info"

post 'accion_change_state' , to: "accions#accion_change_state", as: "accion_change_state"
post 'task_change_state' , to: "tasks#task_change_state", as: "task_change_state"








  get 'home', to: 'home#index', as: "home_page"
  get 'my_tasks/index' , as: "mistasks"
  get 'my_tasks/mytask_cerradas', to: "my_tasks#mytask_cerradas", as: "mytask_cerradas"
  get 'my_tasks/asignados', to: "my_tasks#asignado_por_mi", as: "tasks_asignados"
  get 'my_tasks/mytask_asignadas_cerradas', to: "my_tasks#mytask_asignadas_cerradas", as: "mytask_asignadas_cerradas"

 get 'my_activities/actividades_todas', to: "my_activities#actividades_todas", as: "actividades_todas"
 





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
  delete "delete_amefp/:id", to: "causas#delete_amefp", as: "delete_amefp"

  get '/delete_arbol' , to: "causas#delete_arbol", as: "delete_arbol"
  post 'crear_arbol' , to: "causas#crear_arbol", as: "crear_arbol"

  resources :clinte_proveedors do
  collection { post :import }

end
 get 'proveedores' , to: 'clinte_proveedors#proveedores' , as: "proveedores"
  get 'entidades_gubernamentales' , to: 'clinte_proveedors#entidades_gubernamentales' , as: "entidades_gubernamentales"
  get 'entidades_certificacion' , to: 'clinte_proveedors#entidades_certificacion' , as: "entidades_certificacion"

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
    get 'my_accions/myaccions_cerradas', to: "my_accions#myaccions_cerradas", as: "myaccions_cerradas"

  get 'my_accions/myaccions_asignadas_cerradas', to: "my_accions#myaccions_asignadas_cerradas", as: "myaccions_asignadas_cerradas"
   get 'my_accions/asignados', to: "my_accions#asignado_por_mi", as: "accions_asignados"
    get 'my_accions/invitado', to: "my_accions#invitado", as: "accions_invitado"

     get 'accions/acciones_todas', to: "accions#acciones_todas", as: "acciones_todas"
     get 'accions/acciones_abiertas', to: "accions#acciones_abiertas", as: "acciones_abiertas"
     get 'accions/acciones_cerradas', to: "accions#acciones_cerradas", as: "acciones_cerradas"
     get 'accions/acciones_calendar', to: "accions#acciones_calendar", as: "acciones_calendar"
  
  get 'accions_calendar' , to: "my_accions#accions_calendar", as: "accions_calendar"
  get 'tasks_calendar' , to: "my_tasks#tasks_calendar", as: "tasks_calendar"



  get 'tasks/tasks_todas', to: "tasks#tasks_todas", as: "tasks_todas"
     get 'tasks/tasks_abiertas', to: "tasks#tasks_abiertas", as: "tasks_abiertas"
     get 'tasks/tasks_cerradas', to: "tasks#tasks_cerradas", as: "tasks_cerradas"
   get 'taskst_calendar' , to: "tasks#taskst_calendar", as: "taskst_calendar"
   


  get 'set_cargos/:id', to: "cargos#set_cargos", as: "set_cargos"
  
  
  

          resources :tipos
          #resources :accions
          resources :sources
       
            
          
          
          get "normass/:id", to: "reports#get_normas", as: "get_normas"
          get "sourcee/:id", to: "reports#get_sourcee", as: "get_sourcee"
          get "sourceep/:id", to: "reports#get_sourceep", as: "get_sourceep"
          get "source1/:id/:page/:search", to: "sources#change", as: "change"
          delete "delete_procesos", to: "procesos#delete_procesos", as: "delete_procesos"
         
          delete "delete_cargos", to: "cargos#delete_cargos", as: "delete_cargos"
          post "cerrar_report", to: "reports#cerrar_report", as: "cerrar_report"
          resources :normas do 
                resources :numerals do 
                collection { post :import }
                end                

          end
          resources :employeds do
  collection { post :import }

end
          resources :companies #, only: [:show, :create, :edit, :update, :index]
          get 'company_indicators', to: 'companies#company_indicators', as: "company_indicators"


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
            delete "delete_source_parent", to: "source_parents#delete_source_parent", as: "delete_source_parent"
            
          end
        devise_for :users
          
  #authenticated :user do
    root to: 'dashboard#index'#, as: :authenticated_root
  #end
 
  #root to: 'home#index'


          match "*path" => redirect("/"), via: :get 
          # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
