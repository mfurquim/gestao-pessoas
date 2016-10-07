# Verify permitions to users data manipulation
class UserPolicy < ApplicationPolicy
  # Any profile can see
  def index?
    excluded_users
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

  def uncourse_subject?
    high_users || (record == user)
  end
  def my_academic_informations?
    excluded_users 
  end

  def my_subjects?
    excluded_users
  end
end
