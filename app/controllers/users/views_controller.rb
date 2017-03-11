class Users::ViewsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]
 before_action :configuracion

  
  def configuracion

    if current_user.role !=  "SuperAdmin" && !current_user.rol.configuracion 
        redirect_to root_path

        
    end
    
  end
def index

   if params[:search]
     @users1 = User.search(params[:search])
  else
     @users1 = User.all
  end

  
 case params[:row]
when "email"
  if params[:tipo] == "desc"
  @users = @users1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user).order(email: :desc)
else
   @users = @users1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user).order(email: :asc)
end
when "rol"
  if params[:tipo] == "desc"
  @users = @users1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user).order(rol: :desc)
else
   @users = @users1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user).order(rol: :asc)
end
when "last_name"
  if params[:tipo] == "desc"
  @users = @users1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user).order(last_name: :desc)
else
   @users = @users1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user).order(last_name: :asc)
end
when "last_name"
if params[:tipo] == "desc"
  @users = @users1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user..admin_user).order(name: :desc)
else
   @users = @users1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user).order(name: :asc)
   
end
else

  @users = @users1.paginate(page: params[:page],:per_page => 10).where(admin_user: current_user.admin_user).where.not(role: "SuperAdmin").order(created_at: :desc)
   
end

 

 


  end

  


def show_user

  @user = User.find(params[:id])
   if @user.admin_user != current_user.admin_user
      redirect_to users_index_path, notice: 'Acceso no permitido' 
   end
  
end

def edit_user
@user = User.find(params[:id])
u = User.find(current_user.id)

end

def new_user
u = User.find(current_user.id)


end

def create_user

  @user = User.create(email:params[:email],password:params[:password],password_confirmation:params[:password_confirmation],admin_user:params[:admin_user],role:params[:role], company:params[:company],rol_id:params[:rol_id],employed_id:params[:employed_id],name: params[:name])
  if @user.save
    WelcomeMailer.welcome(@user).deliver
    redirect_to users_index_path
  end
end


def update_user

@user = User.find(params[:id])
@user.update(email:params[:email],password:params[:password],password_confirmation:params[:password_confirmation],admin_user:params[:admin_user],role:params[:role], company:params[:company],rol_id:params[:rol_id],employed_id:params[:employed_id],name: params[:name])
   end

def delete_user
  @user = User.find(params[:id])
  @user.destroy
  
     
end


def order_user

  






end
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
