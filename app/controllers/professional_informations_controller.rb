class ProfessionalInformationsController < ApplicationController
  before_action :set_professional_information, only: [:show, :edit, :update, :destroy]

  # GET /professional_informations
  # GET /professional_informations.json
  def index
    @professional_informations = ProfessionalInformation.all
  end

  # GET /professional_informations/1
  # GET /professional_informations/1.json
  def show
  end

  # GET /professional_informations/new
  def new
    @professional_information = ProfessionalInformation.new
  end

  # GET /professional_informations/1/edit
  def edit
  end

  # POST /professional_informations
  # POST /professional_informations.json
  def create
    @professional_information = ProfessionalInformation.new(professional_information_params)

    respond_to do |format|
      if @professional_information.save
        format.html { redirect_to @professional_information, notice: 'Professional information was successfully created.' }
        format.json { render :show, status: :created, location: @professional_information }
      else
        format.html { render :new }
        format.json { render json: @professional_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professional_informations/1
  # PATCH/PUT /professional_informations/1.json
  def update
    respond_to do |format|
      if @professional_information.update(professional_information_params)
        format.html { redirect_to @professional_information, notice: 'Professional information was successfully updated.' }
        format.json { render :show, status: :ok, location: @professional_information }
      else
        format.html { render :edit }
        format.json { render json: @professional_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professional_informations/1
  # DELETE /professional_informations/1.json
  def destroy
    @professional_information.destroy
    respond_to do |format|
      format.html { redirect_to professional_informations_url, notice: 'Professional information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professional_information
      @professional_information = ProfessionalInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professional_information_params
      params.require(:professional_information).permit(:string, :string, :date, :date, :text)
    end
end
