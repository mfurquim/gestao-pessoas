class AddUserIdToAcademicInformations < ActiveRecord::Migration
  def change
    add_reference :academic_informations, :user, index: true, foreign_key: true
  end
end
