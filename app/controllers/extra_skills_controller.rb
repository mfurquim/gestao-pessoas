class ExtraSkillsController < ApplicationController
  before_action :set_extra_skill, only: [:show, :edit, :update, :destroy]

  # GET /extra_skills
  # GET /extra_skills.json
  def index
    @extra_skills = ExtraSkill.all
  end

  # GET /extra_skills/1
  # GET /extra_skills/1.json
  def show
  end

  # GET /extra_skills/new
  def new
    @extra_skill = ExtraSkill.new
  end

  # GET /extra_skills/1/edit
  def edit
  end

  # POST /extra_skills
  # POST /extra_skills.json
  def create
    @extra_skill = ExtraSkill.new(extra_skill_params)

    respond_to do |format|
      if @extra_skill.save
        format.html { redirect_to @extra_skill, notice: 'Extra skill was successfully created.' }
        format.json { render :show, status: :created, location: @extra_skill }
      else
        format.html { render :new }
        format.json { render json: @extra_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extra_skills/1
  # PATCH/PUT /extra_skills/1.json
  def update
    respond_to do |format|
      if @extra_skill.update(extra_skill_params)
        format.html { redirect_to @extra_skill, notice: 'Extra skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @extra_skill }
      else
        format.html { render :edit }
        format.json { render json: @extra_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extra_skills/1
  # DELETE /extra_skills/1.json
  def destroy
    @extra_skill.destroy
    respond_to do |format|
      format.html { redirect_to extra_skills_url, notice: 'Extra skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extra_skill
      @extra_skill = ExtraSkill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def extra_skill_params
      params.fetch(:extra_skill, {})
    end
end
