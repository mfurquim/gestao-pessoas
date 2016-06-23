class Role < ActiveRecord::Base
  require 'i18n'
  has_many :users

  validates :name, presence: true, format: {with:/\A[a-z]+\Z/i,on: :create}, uniqueness: true
  validates :description, length: {maximum: 300}

  def member_roles
    roles = Role.where.not(name:"administrator").select(:id,:name).map do |role|
        
        role_name = "role."+ role.name.to_s
        puts role_name
        [I18n.t(role_name),role.id]
    end
    roles
  end
end
