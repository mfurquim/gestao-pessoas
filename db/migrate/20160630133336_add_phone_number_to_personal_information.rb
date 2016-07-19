class AddPhoneNumberToPersonalInformation < ActiveRecord::Migration
  def change
    add_column :personal_informations, :phone_number, :string, null: true
  end
end
