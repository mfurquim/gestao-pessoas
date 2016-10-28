class AddCollumnsToProfissionalInformation < ActiveRecord::Migration
  def change
    add_column :profissional_informations, :activity_name, null: true
    add_column :profissional_informations, :local, :string, null: true
    add_column :profissional_informations, :initial_date, :date, null: true
    add_column :profissional_informations, :final_date, :date, null: true
    add_column :profissional_informations, :description, :text, null: true
  end
end
