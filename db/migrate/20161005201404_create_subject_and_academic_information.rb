class CreateSubjectAndAcademicInformation < ActiveRecord::Migration
  def change
    create_table :academic_informations_subjects,id: false do |t|
        t.references :subject, index: {name: 'subject_academic_informations_on_subject_id'}
        t.references :academic_information, index: { name: 'academic_subjects_on_academic_info_id'}
    end
  end
end
