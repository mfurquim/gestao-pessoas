class InfoPersonalsController < ApplicationController
  before_action :set_info_personal, only: [:show, :edit, :update, :destroy]

  # GET /info_personals
  # GET /info_personals.json
  def index
    @info_personals = InfoPersonal.all
  end

  # GET /info_personals/1
  # GET /info_personals/1.json
  def show
  end

  # GET /info_personals/new
  def new
    @info_personal = InfoPersonal.new
  end

  # GET /info_personals/1/edit
  def edit
  end

  # POST /info_personals
  # POST /info_personals.json
  def create
    @info_personal = InfoPersonal.new(info_personal_params)

    respond_to do |format|
      if @info_personal.save
        format.html { redirect_to @info_personal, notice: 'Info personal was successfully created.' }
        format.json { render :show, status: :created, location: @info_personal }
      else
        format.html { render :new }
        format.json { render json: @info_personal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /info_personals/1
  # PATCH/PUT /info_personals/1.json
  def update
    respond_to do |format|
      if @info_personal.update(info_personal_params)
        format.html { redirect_to @info_personal, notice: 'Info personal was successfully updated.' }
        format.json { render :show, status: :ok, location: @info_personal }
      else
        format.html { render :edit }
        format.json { render json: @info_personal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /info_personals/1
  # DELETE /info_personals/1.json
  def destroy
    @info_personal.destroy
    respond_to do |format|
      format.html { redirect_to info_personals_url, notice: 'Info personal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info_personal
      @info_personal = InfoPersonal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def info_personal_params
      params.require(:info_personal).permit(:nome, :email, :rg, :cpf)
    end
end
