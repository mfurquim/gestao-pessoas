class AddAttributes < ActiveRecord::Migration
  def change
    change_table :extra_skills do |t|
      t.string :name
      t.integer :level
      t.references :professional_profile
    end
    change_table :external_projects do |t|
      t.string :location
      t.string :name
      t.references :professional_profile
    end
    change_table :internships do |t|
      t.string :name
      t.string :company
      t.string :description
      t.integer :duration
      t.references :professional_profile
    end
  end
end
