# Personal informations of members zenit
class PersonalInformation < ActiveRecord::Base
  belongs_to :user

  # Actions
  before_save { email.downcase! unless email.nil? }

  # Validations
  validates :email, presence: true, format:
{ with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ },
                    uniqueness: { case_sensitive: false }

  validates :cpf, cpf: true, presence: true, uniqueness: true

  validates :name, format: { with: /[A-z]/, on: :create }, presence: true

  validates :rg, presence: true, length: { is: 7 },
                 format: { with: /\A[0-9]+\Z/ }, uniqueness: true

  validates :phone_number,
            format: { with: /(\(\d{1,2}\)\d{4,5}-\d{4}\z)|\A\Z/ },
            presence: false

  has_attached_file :image, styles: { small: "564x564>" },
                             :url  => "/assets/images/:id/:styl"+
                                      "e/:basename.:extension",
                             :path => ":rails_root/public/assets/images"+
                                      "/:id/:style/:basename.:extension"

  validates_attachment :image, content_type:
                               { content_type: ['image/jpg','image/png'] },
                               size: { in: 0..6.megabytes }

  def age
    my_age = 0
    unless self.birthday.nil?
      my_age = DateTime.current.strftime('%Y%m%d').to_i -
               self.birthday.strftime('%Y%m%d').to_i
      my_age /= 1e4
    end
    my_age.floor
  end
end
