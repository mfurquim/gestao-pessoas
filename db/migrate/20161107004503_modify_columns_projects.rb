class ModifyColumnsProjects < ActiveRecord::Migration
  def change
    rename_column :projects, :project_name, :name
    rename_column :projects, :project_description, :description
  end
end
