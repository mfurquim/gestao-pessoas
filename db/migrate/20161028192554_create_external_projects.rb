class CreateExternalProjects < ActiveRecord::Migration
  def change
    create_table :external_projects do |t|

      t.timestamps null: false
    end
  end
end
