class CreateTimetablings < ActiveRecord::Migration
  def change
    create_table :timetablings do |t|
      t.string :table_position
      t.references :subject, index: true
      t.references :academic_information, index: true
      t.timestamps null: false
    end
  end
end
