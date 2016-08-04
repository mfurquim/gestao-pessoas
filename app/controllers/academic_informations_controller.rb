# Controller for academic informations
class AcademicInformationsController < ApplicationController
  before_action :set_academic_information, only: [:show, :edit, :update]
  before_filter :authenticate_user!
  
  # GET /academic_informations/1
  # GET /academic_informations/1.json
  def show
   # Try save Js array to Ruby array
    #@array_timetabling = JSON.parse(params[:array_timetabling])
    @subjects = Subject.all
  end

  # GET /academic_informations/new
  def new
    @academic_information = AcademicInformation.new
    set_user
    @subjects = Subject.all
  end

  # GET /academic_informations/1/edit
  def edit
    set_user
    @subjects = Subject.all
  end

  # POST /academic_informations
  # POST /academic_informations.json
  def create
    @academic_information = AcademicInformation.new(academic_information_params)
    respond_to do |format|
      if @academic_information.save
        format.html do
    	  redirect_to [@academic_information.user, @academic_information], notice: 'Informação acadêmica criada com sucesso.' 
    	end
            format.json { render :show, status: :created, location: @academic_information }
          else
    	set_user
            format.html { render :new }
            format.json do
    	  render json: @academic_information.errors,
    	         status: :unprocessable_entity 
    	end
      end
    end
  end

  # PATCH/PUT /academic_informations/1
  # PATCH/PUT /academic_informations/1.json
  def update
    respond_to do |format|
      if @academic_information.update(academic_information_params)
        format.html do 
    	  redirect_to [@academic_information.user, @academic_information],
    		      notice: 'Informação acadêmica atualiza com sucesso.'
    	end
            format.json { render :show, status: :ok, location: @academic_information }
      else
    	set_user
            format.html { render :edit }
            format.json do
    	  render json: @academic_information.errors, 
    	  status: :unprocessable_entity 
    	end
      end
    end
  end

  private
    def set_user
      @user ||= User.find(params[:user_id])
    end

      # Use callbacks to share common setup or constraints between actions.
    def set_academic_information
      @academic_information = AcademicInformation.where(id: params[:id],
                                             user_id: params[:user_id]).first
    if @academic_information.nil?
      fail ActiveRecord::RecordNotFound.new('Academic informations not'\
            " found with id #{params[:id]} and user_id: #{params[:user_id]}")
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academic_information_params
      params_attributes = params.require(:academic_information).permit(
        :registration, :input_semester_year, :current_semester_year)
      params_attributes[:user_id] = params[:user_id]
      params_attributes
    end
end
