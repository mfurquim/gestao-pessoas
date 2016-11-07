# User to manage access of system
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true,
                    format: { with: /\A([^@\s]+)@zenitaerospace.com\Z/,
                              message: I18n.t('activerecord.errors.models.'+
                                              'user.email.format') }
  validates :role, presence: true
  belongs_to :role
  has_one :personal_information
  has_one :academic_information
  has_one :professional_profile

  has_many :projects
  has_many :activities 

  def role?(role)
    equals = false
    equals = role.to_s.eql? self.role.name unless self.role.nil?
    equals
  end
end
