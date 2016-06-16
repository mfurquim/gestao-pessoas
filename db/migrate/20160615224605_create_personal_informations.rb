class CreatePersonalInformations < ActiveRecord::Migration
  def change
    create_table :personal_informations do |t|
      t.string :nome
      t.string :email
      t.string :rg
      t.string :cpf

      t.timestamps null: false
    end
  end
end
