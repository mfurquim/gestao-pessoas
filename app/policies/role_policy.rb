class RolePolicy < ApplicationPolicy
  # Define who can see users and they profiles
  def index?
    puts "*"*100
    puts high_users
    puts "*"*100
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

end
