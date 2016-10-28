class CreateProfessionalProfiles < ActiveRecord::Migration
  def change
    create_table :professional_profiles do |t|

      t.timestamps null: false
    end
  end
end
