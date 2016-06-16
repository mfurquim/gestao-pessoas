class PersonalInformation < ActiveRecord::Base
	validates :nome, format: {with: /[A-z]/, on: :create}, presence: true 
   
  	before_save { self.email = email.downcase }
  	# Put format of email Zenit
  	validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, on: :create}, uniqueness: {case_sensitive: false} 
    
    validates :cpf, presence: true, length: {minimum: 11 ,maximum: 11}, format: {with: /[0-9]/, on: :create}, uniqueness: {case_sensitive: false}  

    validates :rg, presence: true, length: {minimum: 7 ,maximum: 7}, format: {with: /[0-9]/, on: :create}, uniqueness: {case_sensitive: false} 
end
