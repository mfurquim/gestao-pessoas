class PersonalInformation < ActiveRecord::Base
	validates :name, format: {with: /[A-z]/, on: :create}, presence: true 
   
  	before_save { self.email.downcase! if not self.email.nil? }
  	# Put format of email Zenit
  	validates :email, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, on: :create}, uniqueness: {case_sensitive: false} 
    
    validates :cpf, presence: true, length: {is:11}, format: {with: /[0-9]/, on: :create}, uniqueness: true

    validates :rg, presence: true, length: {is:7}, format: {with: /[0-9]/, on: :create}, uniqueness: true 
end
