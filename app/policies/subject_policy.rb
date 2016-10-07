# Verify permissions to personal informations manipulation
class SubjectPolicy < ApplicationPolicy
  # Define who can see users and they profiles
  def show?
    excluded_users
  end
  def new?
    high_users
  end

  def index?
    high_users
  end

  # Only exclude can't see the profile of others members
  def edit?
    high_users
  end
  def destroy?
    high_users
  end

  def user_or_high
    excluded_users
  end
  private :user_or_high
end
