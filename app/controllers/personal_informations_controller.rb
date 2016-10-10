# Controller for personal informations
class PersonalInformationsController < ApplicationController
  before_action :set_personal_information, only: [:show, :edit, :update]
  before_filter :authenticate_user!

  # GET /personal_informations/1
  # GET /personal_informations/1.json
  def show
  end

  # GET /personal_informations/new
  def new
    @information = PersonalInformation.new
    set_user
    @information.user= @user
    authorize @information
  end

  # GET /personal_informations/1/edit
  def edit
    set_user
    authorize @information
  end

  # POST /personal_informations
  # POST /personal_informations.json
  def create
    @information = PersonalInformation.new(personal_information_params)
    authorize @information
    respond_to do |format|
      if @information.save
        format.html do
          redirect_to [@information.user, @information],
            notice: 'Informação pessoal criada.'
        end
        format.json { render :show, status: :created, location: @information }
      else
        set_user
        format.html { render :new }
        format.json do
          render json: @information.errors,
            status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /personal_informations/1
  # PATCH/PUT /personal_informations/1.json
  def update
    authorize @information
    respond_to do |format|
      if @information.update(personal_information_params)
        format.html do
          redirect_to [@information.user, @information],
            notice: 'Informação pessoal atualizada.'
        end
        format.json { render :show, status: :ok, location: @information }
      else
        set_user
        format.html { render :edit }
        format.json do
          render json: @information.errors,
            status: :unprocessable_entity
        end
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_personal_information
    @information = PersonalInformation.where(id: params[:id],
                                             user_id: params[:user_id]).first
    if @information.nil?
      fail ActiveRecord::RecordNotFound.new('Personal informations not'\
                                            " found with id #{params[:id]} and user_id: #{params[:user_id]}")
    end
  end

  def set_user
    @user ||= User.find(params[:user_id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def personal_information_params
    params_attributes = params.require(:personal_information).permit(
      :name, :email, :rg, :cpf, :phone_number,:birthday,:address, :image)
    params_attributes[:user_id] = params[:user_id]
    params_attributes
  end
end
