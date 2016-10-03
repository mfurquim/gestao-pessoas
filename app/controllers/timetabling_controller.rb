class TimetablingController < ApplicationController

    # POST /users/:user_id/timetabling to create a new assossiation of timetabling
    def create
        subject = Subject.find(params[:subject_id])
        academic_information = AcademicInformation.find(params[:academic_information_id])
        k=Timetabling.where(table_position: params[:key],academic_information:academic_information.id)
        context = {
            'subject_name': subject.name
            }
        if k.empty?
            Timetabling.create(table_position: params[:key],
                               subject: subject,
                               academic_information: academic_information)
            context[:ok]='created'
        elsif params[:subject_id] != '0'
            k=k[0]
            k.update(subject:subject)
            context[:ok]='updated'
        else
            k=k[0]
            k.destroy!
            context[:ok]='destroyed'
        end
        respond_to do |format|
            format.json{ render json: context, status: :ok }
        end
    end
    private
        def get_academic_subject
        end

end
