# Controller for academic informations
class AcademicInformationsController < ApplicationController
  before_action :set_academic_information, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  after_action :verify_authorized
  # GET /academic_informations
  # GET /academic_informations.json
  def index
    @academic_informations = AcademicInformation.all
    authorize @academic_informations
  end

  # GET /academic_informations/1
  # GET /academic_informations/1.json
  def show
    @academic_information = AcademicInformation.where(user_id: params[:user_id]).first
    authorize @academic_information, :index?
    @timetabling=Timetabling.where(academic_information: @academic_information.id).map{ |k| [k.table_position, k.subject.name]}.to_h
  end

  # GET /academic_informations/new
  def new
    @academic_information = AcademicInformation.new(user_id: params[:user_id])
    authorize @academic_information
  end

  # GET /academic_informations/1/edit
  def edit
    @subjects = Subject.all
    @timetabling=Timetabling.where(academic_information: @academic_information.id).map{ |k| [k.table_position, k.subject.name]}.to_h
    authorize @academic_information,:new?
  end

  # POST /academic_informations
  # POST /academic_informations.json
  def create
    @academic_information = AcademicInformation.new(academic_information_params)
    authorize @academic_information,:new?
    respond_to do |format|
      @subjects=Subject.all
      if @academic_information.save
        format.html { redirect_to [@academic_information.user, @academic_information], notice: 'Academic information was successfully created.' }
        format.json { render :show, status: :created, location: @academic_information }
      else
        format.html { render :new }
        format.json { render json: @academic_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academic_informations/1
  # PATCH/PUT /academic_informations/1.json
  def update
    authorize @academic_information,:new?
    respond_to do |format|
      if @academic_information.update(academic_information_params)
        format.html { redirect_to [@academic_information.user,@academic_information], notice: 'Academic information was successfully updated.' }
        format.json { render :show, status: :ok, location: @academic_information }
      else
        format.html { render :edit }
        format.json { render json: @academic_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academic_informations/1
  # DELETE /academic_informations/1.json
  def destroy
    authorize @academic_information, :new?
    @academic_information.destroy
    respond_to do |format|
      format.html { redirect_to academic_informations_url, notice: 'Academic information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_academic_information
    @academic_information = AcademicInformation.find(params[:id])
  end
  def set_user
    @user = User.find(params[:user_id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def academic_information_params
    permit_params=params.require(:academic_information).permit(:registration, :admission_year, :current_semester)
    permit_params[:user_id]=params[:user_id]
    permit_params
  end
end
