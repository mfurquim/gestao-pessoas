class UsersController < ApplicationController
  # GET /resource/sign_up
  def new
    @resource = User.new
  end

  # POST /resource
  def create
    @resource = User.new(email_params)
    if @resource.save
      render :text=>"the password"
    else
      @resource.email=@email
      render :new
    end
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
