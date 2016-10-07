class CreateAcademicInformations < ActiveRecord::Migration
  def change
    create_table :academic_informations do |t|
      t.string :registration
      t.string :admission_year
      t.integer :current_semester

      t.timestamps null: false
    end
  end
end
