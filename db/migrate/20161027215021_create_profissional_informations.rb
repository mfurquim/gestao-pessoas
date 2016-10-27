class CreateProfissionalInformations < ActiveRecord::Migration
  def change
    create_table :profissional_informations do |t|

      t.timestamps null: false
    end
  end
end
