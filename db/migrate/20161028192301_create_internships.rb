class CreateInternships < ActiveRecord::Migration
  def change
    create_table :internships do |t|

      t.timestamps null: false
    end
  end
end
