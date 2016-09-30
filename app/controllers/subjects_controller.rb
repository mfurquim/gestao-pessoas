class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  after_action :verify_authorized

  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all
    authorize @subjects
    @subject_grid = initialize_grid(@subjects)
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
    authorize Subject
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
    authorize @subject
  end

  # GET /subjects/1/edit
  def edit
    authorize @subject
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)
    authorize @subject, :new?
    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: 'Disciplina cadastrada com sucesso.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
   authorize @subject, :edit?
   respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to @subject, notice: 'Disciplina atualizada com sucesso!' }
        format.json { render :show, status: :ok, location: @subject }
        format.html { render :edit }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    authorize @subject
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Disciplina removida.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:name)
    end

    def set_user
      @user ||= User.find(params[:user_id])
    end
end
