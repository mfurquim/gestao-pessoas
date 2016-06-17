class PersonalInformationsController < ApplicationController
  before_action :set_personal_information, only: [:show, :edit, :update, :destroy]

  # GET /personal_informations
  # GET /personal_informations.json
  def index
    @personal_informations = PersonalInformation.all
  end

  # GET /personal_informations/1
  # GET /personal_informations/1.json
  def show
  end

  # GET /personal_informations/new
  def new
    @personal_information = PersonalInformation.new
  end

  # GET /personal_informations/1/edit
  def edit
  end

  # POST /personal_informations
  # POST /personal_informations.json
  def create
    @personal_information = PersonalInformation.new(personal_information_params)

    respond_to do |format|
      if @personal_information.save
        format.html { redirect_to @personal_information, notice: 'Personal information was successfully created.' }
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
    respond_to do |format|
      if @personal_information.update(personal_information_params)
        format.html { redirect_to @personal_information, notice: 'Personal information was successfully updated.' }
        format.json { render :show, status: :ok, location: @personal_information }
      else
        format.html { render :edit }
        format.json { render json: @personal_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_informations/1
  # DELETE /personal_informations/1.json
  def destroy
    @personal_information.destroy
    respond_to do |format|
      format.html { redirect_to personal_informations_url, notice: 'Personal information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personal_information
      @personal_information = PersonalInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def personal_information_params
      params.require(:personal_information).permit(:name, :email, :rg, :cpf)
    end
end
