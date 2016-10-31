class CreateExtraSkills < ActiveRecord::Migration
  def change
    create_table :extra_skills do |t|

      t.timestamps null: false
    end
  end
end
