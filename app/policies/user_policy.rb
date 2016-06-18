class UserPolicy < ApplicationPolicy
  # Any profile can see
  def index?
    true
  end
  # Define who can see users and they profiles
  def new?
    high_users
  end

  # Policies to open form of edit Role
  def create?
    high_users
  end
  
  # Only exclude can't see the profile of others members 
  def profile?
    excluded_users 
  end
end
