# Controller for roles changes
class RolesController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized

  # GET /users/all
  def index
    authorize Role
    @roles_users = {}
    User.where("email != 'admin@zenitaerospace.com'").each do |user|
      @roles_users[user.role.name] = [] if @roles_users[user.role.name].nil?
      @roles_users[user.role.name] << user
    end
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
  private :roles
end