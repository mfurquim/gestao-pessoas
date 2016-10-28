class ExternalProjectsController < ApplicationController
  before_action :set_external_project, only: [:show, :edit, :update, :destroy]

  # GET /external_projects
  # GET /external_projects.json
  def index
    @external_projects = ExternalProject.all
  end

  # GET /external_projects/1
  # GET /external_projects/1.json
  def show
  end

  # GET /external_projects/new
  def new
    @external_project = ExternalProject.new
  end

  # GET /external_projects/1/edit
  def edit
  end

  # POST /external_projects
  # POST /external_projects.json
  def create
    @external_project = ExternalProject.new(external_project_params)

    respond_to do |format|
      if @external_project.save
        format.html { redirect_to @external_project, notice: 'External project was successfully created.' }
        format.json { render :show, status: :created, location: @external_project }
      else
        format.html { render :new }
        format.json { render json: @external_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /external_projects/1
  # PATCH/PUT /external_projects/1.json
  def update
    respond_to do |format|
      if @external_project.update(external_project_params)
        format.html { redirect_to @external_project, notice: 'External project was successfully updated.' }
        format.json { render :show, status: :ok, location: @external_project }
      else
        format.html { render :edit }
        format.json { render json: @external_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /external_projects/1
  # DELETE /external_projects/1.json
  def destroy
    @external_project.destroy
    respond_to do |format|
      format.html { redirect_to external_projects_url, notice: 'External project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_external_project
      @external_project = ExternalProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def external_project_params
      params.fetch(:external_project, {})
    end
end
