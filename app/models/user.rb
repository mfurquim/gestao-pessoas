# User to manage access of system
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true,
                    format: { with: /\A([^@\s]+)@zenitaerospace.com\Z/ }
  validates :role, presence: true
  belongs_to :role
  has_one :personal_information

  def role?(role)
    equals = false
    equals = role.to_s.eql? self.role.name unless self.role.nil?
    equals
  end
end
