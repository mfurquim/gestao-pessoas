# Inheritance from devise
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :require_no_authentication, only: []
  def new
    set_users
    authorize User
  end

  # POST /users/sign_up
  def create
    authorize User
    @user = User.new(email_params)
    if @user.save
      flash[:success] = "Usuário #{@user.email} criado com sucesso."\
                       " Senha padrão: #{email_params['password']}"
      redirect_to roles_url
    else
      set_users
      render :new
    end
  end

  # Define the all params for users
  def email_params
    resource_attributes = params.require(:user).permit(:email)
    @email = resource_attributes['email']
    resource_attributes['email'] += '@zenitaerospace.com'
    resource_attributes['password'] = 'ZenitAerospace'
    resource_attributes['role'] = Role.where(id: params[:role]).first
    resource_attributes
  end

  def set_users
    @user ||= User.new
    @user.email = @email unless @email.nil?
    @roles ||= Role.new.member_roles
  end
end
