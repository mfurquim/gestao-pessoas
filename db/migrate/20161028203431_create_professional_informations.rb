class CreateProfessionalInformations < ActiveRecord::Migration
  def change
    create_table :professional_informations do |t|
      t.string :activity_name
      t.string :local
      t.date :initial_date
      t.date :final_date
      t.text :description

      t.timestamps null: false
    end
  end
end
