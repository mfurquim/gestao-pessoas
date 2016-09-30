class CreateAcademicInformations < ActiveRecord::Migration
  def change
    create_table :academic_informations do |t|
      t.string :registration
      t.string :input_semester_year
      t.string :current_semester_year

      t.timestamps null: false
    end
  end
end
