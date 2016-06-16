class CreateInfoPersonals < ActiveRecord::Migration
  def change
    create_table :info_personals do |t|
      t.string :nome
      t.string :email
      t.string :rg
      t.string :cpf

      t.timestamps null: false
    end
  end
end
