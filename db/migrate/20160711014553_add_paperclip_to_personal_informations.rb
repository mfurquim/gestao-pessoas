class AddPaperclipToPersonalInformations < ActiveRecord::Migration
  def change
    add_attachment :personal_informations, :image
  end
end
