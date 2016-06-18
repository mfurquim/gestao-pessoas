class UsersController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized
  # GET /users/sign_up
  def new
    authorize User
    @resource = User.new
  end

  # POST /users/sign_up
  def create
    authorize User
    @resource = User.new(email_params)
    if @resource.save
      render :text=>"the password"
    else
      @resource.email=@email
      render :new
    end
  end

  # GET /users/:id
  # Define a route to see the profile of a user
  def profile
    user_query = User.where(id_params)
    if not user_query.empty?
      @user = user_query.first
      authorize @user
      render :profile
    else
      raise ActiveRecord::RecordNotFound.new, User.model_name.name
    end
  end
  
  # GET /users/myprofile
  def myprofile
    @user = current_user
    authorize @user
    render :profile
  end
  # Verify the params to get a user
  def id_params
    {:id => params[:id]}
  end

  # Define the all params for users
  def email_params
    resource_attributes = params.require(:user).permit(:email)
    @email=resource_attributes["email"]
    resource_attributes["email"]+="@zenitaerospace.com"
    resource_attributes["password"] = "ZenitAerospace"
    resource_attributes["role"] = Role.where(default: true).first
    resource_attributes
  end

  private :email_params
end
