class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
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
