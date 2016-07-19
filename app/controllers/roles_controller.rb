# Controller for roles changes
class RolesController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized

  # GET /roles/
  def index
    authorize Role
    @roles = Role.select(:name).map {|role| role.name}
    @roles << 'all'
    @actual_role = params[:role]
    @role_users = initialize_grid(grid_active_record(@actual_role))
    puts @role_users.class
  end

  # GET /user/:user_id/role_edit
  def edit
    authorize Role
    @user = User.where(id: params[:user_id]).first
    @roles = roles
  end

  # PUT /user/:user_id/role_edit
  # Update the role for a given user
  def update
    authorize Role
    user = User.where(id: params[:user_id]).first
    if user.update(role_id: params[:role])
      flash[:notice] = I18n.t('.role.messages.change_role')
      redirect_to action: 'index'
    else
      render :edit
    end
  end

  def roles
    role = Role.new
    role.member_roles
  end
  def grid_active_record(role_name)
    if role_name.to_s != 'all'
      role = Role.where(name: role_name)
      raise ActiveRecord::RecordNotFound.new("Role don't found"+
        " with name #{role_name}") if role.first.nil?
      User.where(
        "email != 'admin@zenitaerospace.com' and role_id = ?",role.first.id )
    else
      User.where("email != 'admin@zenitaerospace.com'")
    end
  end
  private :roles, :grid_active_record
end
