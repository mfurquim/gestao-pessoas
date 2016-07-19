class AddUserToPersonalInformations < ActiveRecord::Migration
  def change
    add_reference :personal_informations, :user, index: true, foreign_key: true
  end
end
