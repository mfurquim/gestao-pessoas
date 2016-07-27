class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.date :begin_date
      t.date :end_date
      t.boolean :status

      t.timestamps null: false
    end
  end
end
