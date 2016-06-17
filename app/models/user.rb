class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true, format: {with: /\A([^@\s]+)@zenitaerospace.com\Z/, on: :create}

  belongs_to :role
  has_one :personal_information
  
  def role?(role)
    equals = false
    if not self.role.nil?
      equals = role.to_s.eql? self.role.name
    end
    equals
  end
end
