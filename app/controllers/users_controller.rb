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
      @timetabling = Timetabling.where(academic_information: @user.academic_information).map{ |clas| [clas.table_position,clas.subject.name]}.to_h
      authorize @user
      render :profile
    else
      fail ActiveRecord::RecordNotFound.new, User.model_name.name
    end
  end

  # GET /users/myprofile
  def myprofile
    @user = current_user
    @timetabling = Timetabling.where(academic_information: @user.academic_information).map{ |clas| [clas.table_position,clas.subject.name]}.to_h

    authorize @user, :profile?
    render :profile
  end

  # Verify the params to get a user
  def id_params
    { id: params[:id] }
  end
  
  # GET /my academic information
  def my_academic_informations
    @user = current_user
    authorize @user, :my_academic_informations?

    @timetabling = Timetabling.where(academic_information: @user.academic_information).map{ |clas| [clas.table_position,clas.subject.name]}.to_h
    render :academic_information
  end
  def my_subjects
    @user = current_user
    authorize @user, :my_subjects?
    render :subject
  end
  def my_professional_profile
    @user = current_user
    
    ProfessionalProfile.create(user:@user) if @user.professional_profile.nil?
    authorize @user, :profile?
    redirect_to [@user,@user.professional_profile]
  end

  private :id_params
end
