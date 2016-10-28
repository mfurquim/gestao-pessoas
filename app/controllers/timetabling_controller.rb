class TimetablingController < ApplicationController
  after_action :verify_authorized
  # /GET /users/:user_id/timetabling show a specific timetabling
  def show
    @academic_information = AcademicInformation.find_by_user_id(params[:user_id])
    authorize Timetabling
    @subjects = Subject.all
    @timetabling=Timetabling.where(academic_information: @academic_information.id).map{ |k| [k.table_position, k.subject.name]}.to_h
  end

  def edit
    @academic_information = AcademicInformation.find_by_user_id(params[:user_id])
    authorize @academic_information, :new?
    @user = @academic_information.user
    @subjects = Subject.all
    @timetabling=Timetabling.where(academic_information: @academic_information.id).map{ |k| [k.table_position, k.subject.name]}.to_h
  end

  # /GET /users/:user_id/coursed_subject show the list off made disciplines
  # by a user
  def made_subject
    authorize Timetabling, :show?
    academic_information = AcademicInformation.where(
      user_id: params[:user_id]).first

    respond_to do |format|
      unless academic_information.nil?
        @subjects = academic_information.subjects
        @user = academic_information.user
        format.html { render :coursed }
        format.json { render json: @subject }
      else
        format.html { redirect_to  user_academic_informations_path, alert: "Haven't register any academic information" }
      end
    end
  end

  # GET /users/:user_id/update_coursed_subject, obtain all subjects the
  # user didn't made yet
  def uncourse_subject
    authorize current_user
    academic = AcademicInformation.select(:id)
    .where(user_id: params[:user_id]).first
    @unsubjects = Subject.select(:id,:name).where.not(id: academic.subjects)

    respond_to do |format|
      format.json { render json: @unsubjects }
    end
  end

  # POST /users/:user_id/update_coursed_subject, create a association with user
  # and a discipline id
  def update_coursed
    authorize current_user, :uncourse_subject?
    subject = Subject.select(:id,:name).where(id: params[:subject_id]).first
    subject.user_id = current_user.id
    subject.save
    academic = AcademicInformation
    .where(user_id: params[:user_id]).first
    subject.academic_informations<< academic
    respond_to do |format|
      format.json { render json: {message: "Salvo #{subject.name}"}, status: :ok }
    end
  end

  # POST /users/:user_id/timetabling to create a new association of timetabling
  # or destroy a existing association
  def create

    academic_information = AcademicInformation.find(params[:academic_information_id])
    authorize academic_information, :new?
    timetabling = Timetabling.where(table_position: params[:table_position],
                                    academic_information: academic_information.id).first


    subject = Subject.where(id: params[:subject_id]).first
    context = {subject_name: ''}
    if !subject.nil?
      context[:ok]=create_or_update(timetabling,
                                    academic_information, subject)
      context[:subject_name]=subject.name
    elsif !timetabling.nil?
      timetabling.destroy!
      context[:ok]='destroyed'
    else
      raise "subject and timetabling is nil"
    end

    respond_to do |format|
      format.json{ render json: context, status: :ok }
    end
  end

  private
  def create_or_update(timetabling, academic_information,
                       subject)
    if timetabling.nil?
      Timetabling.create(table_position: params[:table_position],
                         subject: subject,
                         academic_information: academic_information)
      return "created"
    else
      timetabling.update(subject:subject)
      return "updated"
    end
  end

end
