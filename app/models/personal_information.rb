class PersonalInformation < ActiveRecord::Base

  belongs_to :user

  # Actions   
  before_save { self.email.downcase! if not self.email.nil? }
    
  # Validations
  validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, on: :create}, uniqueness: {case_sensitive: false} 
    
  validates :cpf, cpf: true, presence: true, uniqueness: true

  validates :name, format: {with: /[A-z]/, on: :create}, presence: true 

  validates :rg, presence: true, length: {is:7}, format: {with: /\A[0-9]+\Z/}, uniqueness: true 

  validates :phone_number, format: {with: /(\(\d{1,2}\)\d{4,5}-\d{4}\z)|\A\Z/}, presence: false
end
