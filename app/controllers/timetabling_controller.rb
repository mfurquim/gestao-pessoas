class TimetablingController < ApplicationController
    
    def show
        @academic_information = AcademicInformation.find_by_user_id(params[:user_id])
        @subjects = Subject.all
        @timetabling=Timetabling.where(academic_information: @academic_information.id).map{ |k| [k.table_position, k.subject.name]}.to_h
    end

    def edit
        @academic_information = AcademicInformation.find_by_user_id(params[:user_id])
        @user = @academic_information.user
        @subjects = Subject.all
        @timetabling=Timetabling.where(academic_information: @academic_information.id).map{ |k| [k.table_position, k.subject.name]}.to_h
    end
    # POST /users/:user_id/timetabling to create a new assossiation of timetabling
    def create
        academic_information = AcademicInformation.find(params[:academic_information_id])
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
