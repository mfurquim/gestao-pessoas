class PersonalInformationsController < ApplicationController
  before_action :set_personal_information, only: [:show, :edit, :update]
  before_filter :authenticate_user!

  # GET /personal_informations/1
  # GET /personal_informations/1.json
  def show
  end

  # GET /personal_informations/new
  def new
    @personal_information = PersonalInformation.new
    authorize @personal_information
  end

  # GET /personal_informations/1/edit
  def edit
    authorize @personal_information
  end

  # POST /personal_informations
  # POST /personal_informations.json
  def create
    @personal_information = PersonalInformation.new(personal_information_params)
    authorize @personal_information
    respond_to do |format|
      if @personal_information.save
        format.html { redirect_to [current_user,@personal_information], notice: 'Informação pessoal criada.' }
        format.json { render :show, status: :created, location: @personal_information }
      else
        format.html { render :new }
        format.json { render json: @personal_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_informations/1
  # PATCH/PUT /personal_informations/1.json
  def update
    authorize @personal_information
    respond_to do |format|
      if @personal_information.update(personal_information_params)
        format.html { redirect_to [current_user,@personal_information], notice: 'Informação pessoal atualizada.' }
        format.json { render :show, status: :ok, location: @personal_information }
      else
        format.html { render :edit }
        format.json { render json: @personal_information.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_information
      @personal_information = PersonalInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_information_params
      params_attributes = params.require(:personal_information).permit(:name, :email, :rg, :cpf)
      params_attributes[:user_id]=params[:user_id]
      params_attributes
    end
end
