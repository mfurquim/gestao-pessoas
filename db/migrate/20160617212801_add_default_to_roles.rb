class AddDefaultToRoles < ActiveRecord::Migration
  def change
    add_column :roles, :default, :boolean, default: false
  end
end
