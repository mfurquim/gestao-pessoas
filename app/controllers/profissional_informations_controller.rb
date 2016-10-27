class ProfissionalInformationsController < ApplicationController
  before_action :set_profissional_information, only: [:show, :edit, :update, :destroy]

  # GET /profissional_informations
  # GET /profissional_informations.json
  def index
    @profissional_informations = ProfissionalInformation.all
  end

  # GET /profissional_informations/1
  # GET /profissional_informations/1.json
  def show
  end

  # GET /profissional_informations/new
  def new
    @profissional_information = ProfissionalInformation.new
  end

  # GET /profissional_informations/1/edit
  def edit
  end

  # POST /profissional_informations
  # POST /profissional_informations.json
  def create
    @profissional_information = ProfissionalInformation.new(profissional_information_params)

    respond_to do |format|
      if @profissional_information.save
        format.html { redirect_to @profissional_information, notice: 'Profissional information was successfully created.' }
        format.json { render :show, status: :created, location: @profissional_information }
      else
        format.html { render :new }
        format.json { render json: @profissional_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profissional_informations/1
  # PATCH/PUT /profissional_informations/1.json
  def update
    respond_to do |format|
      if @profissional_information.update(profissional_information_params)
        format.html { redirect_to @profissional_information, notice: 'Profissional information was successfully updated.' }
        format.json { render :show, status: :ok, location: @profissional_information }
      else
        format.html { render :edit }
        format.json { render json: @profissional_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profissional_informations/1
  # DELETE /profissional_informations/1.json
  def destroy
    @profissional_information.destroy
    respond_to do |format|
      format.html { redirect_to profissional_informations_url, notice: 'Profissional information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profissional_information
      @profissional_information = ProfissionalInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profissional_information_params
      params.fetch(:profissional_information, {})
    end
end
