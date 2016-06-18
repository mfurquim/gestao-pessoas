class RoleController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized

  # GET /users/all
  def index
    authorize Role
    @roles_users = {}
    User.where("email != 'admin@zenitaerospace.com'").each do |user| 
      @roles_users[user.role.name] = [] if @roles_users[user.role.name].nil?
      @roles_users[user.role.name] <<  user
    end
  end

  # GET /user/:id/role_edit
  def edit
    authorize Role
    @user = User.where(id: params[:id]).first

    @roles = Role.select(:id,:name).map do |role|
       role_name = "role."+role.name.to_s
       [translate(role_name),role.id]
    end
  end

  # PUT /user/:id/role_edit
  # Update the role for a given user
  def update
    authorize Role
    user = User.where(id:params[:id]).first
    user.role_id = params[:role]
    if user.update(role_id:params[:role])
      redirect_to action: "index"
    else
      render :edit
    end
  end 

end