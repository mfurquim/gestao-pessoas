# Model to manage permissions
class Role < ActiveRecord::Base
  require 'i18n'
  has_many :users

  validates :name, presence: true, format: { with: /\A[a-z]+\Z/i },
                   uniqueness: true
  validates :description, length: { maximum: 300 }

  def member_roles
    roles = Role.where.not(name: 'administrator').select(:id, :name)
    all_roles = roles.map do |role|
      role_name = 'role.' + role.name.to_s
      [I18n.t(role_name), role.id]
    end
    all_roles
  end
end
