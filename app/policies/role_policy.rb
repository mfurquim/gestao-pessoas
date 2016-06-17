class RolePolicy < ApplicationPolicy
  # Define who can see users and they profiles
  def index?
    high_users
  end

  # Policies to open form of edit Role
  def edit?
    high_users
  end

  # Policies to update user Role
  def update?
    high_users
  end

  def high_users
    user.role?(:administrator) || user.role?(:personmanager)
  end

  private :high_users
end
