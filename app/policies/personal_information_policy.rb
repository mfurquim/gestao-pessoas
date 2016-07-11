# Verify permissions to personal informations manipulation
class PersonalInformationPolicy < ApplicationPolicy
  # Define who can see users and they profiles
  def new?
    user_or_high
  end

  # Policies to open form of edit Role
  def create?
    user_or_high
  end

  # Only exclude can't see the profile of others members
  def edit?
    user_or_high
  end

  def update?
    user_or_high
  end

  def user_or_high
    excluded_users
  end
  private :user_or_high
end
