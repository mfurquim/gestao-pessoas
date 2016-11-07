class ModofyColumnsProjectActivities < ActiveRecord::Migration
  def change
    add_reference :activities, :user, index: true, foreign_key: true
    add_reference :activities, :project, index: true, foreign_key: true
    add_reference :projects, :user, index: true, foreign_key: true
    remove_column :projects, :manager_name
  end
end
