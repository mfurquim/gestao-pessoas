class AddUserToProfessionalInformations < ActiveRecord::Migration
  def change
    add_reference :professional_informations, :user, index: true, foreign_key: true
  end
end
