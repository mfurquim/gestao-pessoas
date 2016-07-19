# Controller off users
class UsersController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized

  # GET /users/all for see all users, not able to edit!
  def index
    excluded_role = Role.where(name: 'exclude').first
    @users = initialize_grid(User.where.not(role: excluded_role,
                             email: 'admin@zenitaerospace.com'),
                            order: 'personal_informations.name', 
                            custom_order: {
                               'personal_informations.name' => 
                               'COALESCE(?,"Não possui")',
                               'personal_informations.phone_number' =>
                               'COALESCE(?,"Não possui")'
                             })

    authorize User
    render :index
  end

  # GET /users/:id
  # Define a route to see the profile of a user
  def profile
    user_query = User.where(id_params)
    if !user_query.empty?
      @user = user_query.first
      authorize @user
      render :profile
    else
      fail ActiveRecord::RecordNotFound.new, User.model_name.name
    end
  end

  # GET /users/myprofile
  def myprofile
    @user = current_user
    authorize @user, :profile?
    render :profile
  end

  # Verify the params to get a user
  def id_params
    { id: params[:id] }
  end

  private :id_params
end
