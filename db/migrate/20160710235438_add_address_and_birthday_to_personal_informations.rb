class AddAddressAndBirthdayToPersonalInformations < ActiveRecord::Migration
  def change
    add_column :personal_informations, :birthday, :date
    add_column :personal_informations, :address, :text
  end
end
